//
//  APIService.swift
//  MercadoLibreSearch
//
//  Created by Diego Andres Mazo Munoz on 8/06/21.
//

import Foundation
import Combine

protocol ProductsServiceType {
    func getProducts(from query: String) -> AnyPublisher<[ProductEntity], CloudError>
}

class ProductsService: ProductsServiceType {
    private let baseURL = "https://api.mercadolibre.com/sites/MCO/search?q="
    private let currenciesBaseURL = "https://api.mercadolibre.com/currencies/"
    private let apiService: APIServiceType
    
    init(apiService: APIServiceType) {
        self.apiService = apiService
    }
    
    func getProducts(from query: String) -> AnyPublisher<[ProductEntity], CloudError> {
        return search(for: query)
            .map({ searchEntity -> [ProductEntity] in
                return searchEntity.products
            }).flatMap({ products -> AnyPublisher<ProductEntity, CloudError> in
                Publishers.Sequence(sequence: products).eraseToAnyPublisher()
            }).flatMap({ product in
                self.getCurrency(for: product.currencyId)
                    .map({ currency -> ProductEntity in
                        var product = product
                        product.currency = currency
                        return product
                    })
            })
            .collect()
            .eraseToAnyPublisher()
    }
    
    func search(for query: String) -> AnyPublisher<SearchEntity, CloudError> {
        // TO-DO: Manejar el URL optional Binding
        let urlString = baseURL + query
        let url = URL(string: urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)!
        let request = URLRequest(url: url)
        
        return apiService.call(request, type: SearchAPI.self)
            .map({ SearchWrapper.map(input: $0)})
            .eraseToAnyPublisher()
    }
    
    func getCurrency(for currencyId: String) -> AnyPublisher<CurrencyEntity, CloudError> {
        // TO-DO: Manejar el URL optional Binding
        let urlString = currenciesBaseURL + currencyId
        let url = URL(string: urlString)!
        let request = URLRequest(url: url)
        
        return apiService.call(request, type: CurrencyAPI.self)
            .map({ CurrencyWrapper.map(input: $0)})
            .eraseToAnyPublisher()
    }
}

