//
//  ProductsViewController.swift
//  MercadoLibreSearch
//
//  Created by Diego Andres Mazo Munoz on 9/06/21.
//

import UIKit
import Combine

class ProductsViewController: UIViewController {
    private var presenter: ProductsPresenter
    private var tableViewManager: ProductsTableViewManager!
    
    public var customView: ProductsViewType {
        view as! ProductsViewType
    }
    
    override func loadView() {
        view = ProductsView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeViewElements()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    public init(presenter: ProductsPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        
        self.presenter.view = self
        self.presenter.viewDidLoad()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initializeViewElements() {
        tableViewManager = ProductsTableViewManager(tableView: customView.productsTableView, sections: [])
        tableViewManager.delegate = self
        customView.searchBar.delegate = self
    }
    
    private func transformData(_ data: [ProductEntity]) -> [ProductsTableViewCellModel] {
        return data.map {
            ProductsTableViewCellModel(name: $0.title, price: $0.price, installments: $0.installments, currency: $0.currency, thumbnailLink: $0.thumbnailLink)
        }
    }
}

extension ProductsViewController: ProductsViewControllerType {
    func show(_ productViewStatus: ProductsViewStatus, products: [ProductEntity]?) {
        switch productViewStatus {
        case .showLoadingSearch:
            customView.setupView(for: .showLoadingSearch)
        case .showNotResults:
            customView.setupView(for: .showNotResults)
        case .showProducts:
            guard let products = products else { return }
            customView.setupView(for: .showProducts)
            
            tableViewManager.sections = [
                ProductsTableViewSectionModel(title: "", data: transformData(products))
            ]
        case .showError:
            customView.setupView(for: .showError)
        }
    }
}

extension ProductsViewController: DidSelectRowActionDelegate {
    func cellPressed(for position: Int) {
        presenter.openDetailProduct(for: position)
    }
}

extension ProductsViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        guard let query = searchBar.text else { return }
        presenter.getProducts(for: query)
    }
    
    func position(for bar: UIBarPositioning) -> UIBarPosition {
        return .topAttached
    }
}
