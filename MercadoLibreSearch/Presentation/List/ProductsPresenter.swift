//
//  ProductsPresenter.swift
//  MercadoLibreSearch
//
//  Created by Diego Andres Mazo Munoz on 9/06/21.
//

import Combine
import Foundation
import UIKit
import os.log

final class ProductsPresenter {
    weak var view: ProductsViewControllerType?
    private var productsService: ProductsServiceType
    private var navigator: Navigator
    
    private var products = [ProductEntity]()
    private var cancellable: Set<AnyCancellable> = Set<AnyCancellable>()
    
    init(productsService: ProductsServiceType, navigator: Navigator) {
        self.productsService = productsService
        self.navigator = navigator
    }
    
    func viewDidLoad() {}
}

extension ProductsPresenter: ProductsPresenterType {
    func getProducts(for query: String) {
        self.view?.show(.showLoadingSearch, products: nil)
        productsService.getProducts(from: query)
            .sink { [weak self] errorCompletion in
                if case .failure(let err) = errorCompletion {
                    self?.view?.show(.showError, products: nil)
                    
                    let logger = Logger.init(subsystem: "ProductsPresenter", category: "ProductsList")
                    logger.error("Error retrieving products: \(err.errorDescription)")
                }
            } receiveValue: { [weak self] products in
                if products.isEmpty {
                    self?.view?.show(.showNotResults, products: nil)
                } else {
                    self?.products = products
                    self?.view?.show(.showProducts, products: products)
                }
            }.store(in: &cancellable)
    }
    
    func openDetailProduct(for position: Int) {
        let productSelected = products[position]
        navigator.navigateToDetail(product: productSelected)
    }
}
