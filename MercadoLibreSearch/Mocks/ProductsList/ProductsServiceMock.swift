//
//  ProductsServiceMock.swift
//  MercadoLibreSearch
//
//  Created by Diego Andres Mazo Munoz on 15/06/21.
//

import Foundation
import Combine

class ProductsServiceMock: ProductsServiceType {
    var productsFromService: [ProductEntity] = []
    
    func getProducts(from query: String) -> AnyPublisher<[ProductEntity], CloudError> {
        return Future<[ProductEntity], CloudError> { promise in
            let products = ProductsDataMock.getProductsDataMock()
            promise(.success(products))
        }.eraseToAnyPublisher()
    }
}
