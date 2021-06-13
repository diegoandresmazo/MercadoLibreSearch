//
//  ProductsPresenter.swift
//  MercadoLibreSearch
//
//  Created by Diego Andres Mazo Munoz on 9/06/21.
//

import Combine

final class ProductsPresenter {
    weak var view: ProductsViewControllerType?
    private var productsService: ProductsServiceType
    private var cancellable: Set<AnyCancellable> = Set<AnyCancellable>()
    
    init(productsService: ProductsServiceType) {
        self.productsService = productsService
    }
    
    func viewDidLoad() {}
}

extension ProductsPresenter: ProductsPresenterType {
    func getProducts(for query: String) {
        productsService.getProducts(from: query).sink { errorCompletion in
            if case .failure(let err) = errorCompletion {
                // TO-DO: Manejar el error.
                print("Error trayendo productos: \(err.errorDescription)")
            }
        } receiveValue: { products in
            self.view?.showProducts(products)
        }.store(in: &cancellable)
    }
}
