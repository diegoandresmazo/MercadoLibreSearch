//
//  ProductsContract.swift
//  MercadoLibreSearch
//
//  Created by Diego Andres Mazo Munoz on 9/06/21.
//

import UIKit

protocol ProductsViewControllerType: AnyObject {
    func showProducts(_ products: [ProductEntity])
}

protocol ProductsPresenterType: AnyObject {
    func getProducts(for query: String)
}

protocol ProductsViewType: UIView {
    var productsTableView: UITableView { get }
    var searchBar: UISearchBar { get }
}
