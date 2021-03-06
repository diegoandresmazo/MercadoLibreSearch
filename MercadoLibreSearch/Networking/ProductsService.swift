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
    private let session: URLSession
    
    init(apiService: APIServiceType, urlSession: URLSession = .shared) {
        self.apiService = apiService
        self.session = urlSession
    }
    
    /**
     * A call is made to the API with the query and then a nested call is made to get the currency of the product
     */
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
    
    private func search(for query: String) -> AnyPublisher<SearchEntity, CloudError> {
        let urlString = baseURL + query
        guard let urlWithPercentEncoding = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed), let url = URL(string: urlWithPercentEncoding) else {
            preconditionFailure("Bad base URL")
        }
        
        let request = URLRequest(url: url)
        return apiService.call(request, urlSession: session, type: SearchAPI.self)
            .map({ SearchWrapper.map(input: $0)})
            .eraseToAnyPublisher()
    }
    
    private func getCurrency(for currencyId: String) -> AnyPublisher<CurrencyEntity, CloudError> {
        let urlString = currenciesBaseURL + currencyId
        guard let url = URL(string: urlString) else {
            preconditionFailure("Bad currencies URL")
        }
        
        let request = URLRequest(url: url)
        return apiService.call(request, urlSession: session, type: CurrencyAPI.self)
            .map({ CurrencyWrapper.map(input: $0)})
            .eraseToAnyPublisher()
    }
}
