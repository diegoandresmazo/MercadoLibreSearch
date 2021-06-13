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
        customView.searchBar.delegate = self
    }
    
    private func transformData(_ data: [ProductEntity]) -> [ProductsTableViewCellModel] {
        return data.map {
            ProductsTableViewCellModel(name: $0.title, price: $0.price, installments: $0.installments, currency: $0.currency, imageLink: $0.imageLink)
        }
    }
}

extension ProductsViewController: ProductsViewControllerType {
    func showProducts(_ products: [ProductEntity]) {
        tableViewManager.sections = [
            ProductsTableViewSectionModel(title: "", data: transformData(products))
        ]
    }
}

extension ProductsViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        let query = searchBar.text
//        TO-DO: Manehar el force unwrapping
        presenter.getProducts(for: query!)
    }
    
    func position(for bar: UIBarPositioning) -> UIBarPosition {
        return .topAttached
    }
}
