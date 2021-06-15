//
//  ProductsContract.swift
//  MercadoLibreSearch
//
//  Created by Diego Andres Mazo Munoz on 9/06/21.
//

import UIKit

protocol ProductsViewControllerType: DidSelectRowActionDelegate {
    func show(_ productViewStatus: ProductsViewStatus, products: [ProductEntity]?)
}

protocol ProductsPresenterType: AnyObject {
    func getProducts(for query: String)
    func openDetailProduct(for position: Int)
}

protocol ProductsViewType: UIView {
    var productsTableView: UITableView { get }
    var searchBar: UISearchBar { get }
    func setupView(for status: ProductsViewStatus)
}
