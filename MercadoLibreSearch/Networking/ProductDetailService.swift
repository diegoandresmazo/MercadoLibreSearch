//
//  ProductDetailService.swift
//  MercadoLibreSearch
//
//  Created by Diego Andres Mazo Munoz on 13/06/21.
//

import Foundation
import Combine

protocol ProductDetailServiceType {
    func getProductDetailInfo(for productId: String) -> AnyPublisher<ProductDetailInfoEntity, CloudError>
}

class ProductDetailService: ProductDetailServiceType {
    private let baseURL = "https://api.mercadolibre.com/items/"
    private let sellerBaseURL = "https://api.mercadolibre.com/users/"
    private let apiService: APIServiceType
    
    private let session: URLSession
    
    init(apiService: APIServiceType, urlSession: URLSession = .shared) {
        self.apiService = apiService
        self.session = urlSession
    }
    
    func getProductDetailInfo(for productId: String) -> AnyPublisher<ProductDetailInfoEntity, CloudError> {
        let urlString = baseURL + productId
        guard let url = URL(string: urlString) else {
            preconditionFailure("Bad Product URL")
        }
        
        let request = URLRequest(url: url)
        
        return apiService.call(request, urlSession: session, type: ProductDetailInfoAPI.self)
            .map({ ProductDetailInfoWrapper.map(input: $0)})
            .flatMap({ productDetail in
                self.getSeller(for: productDetail.sellerId)
                    .map({ seller -> ProductDetailInfoEntity in
                        var productDetail = productDetail
                        productDetail.seller = seller
                        return productDetail
                    })
            })
            .eraseToAnyPublisher()
    }
    
    private func getSeller(for sellerId: Int) -> AnyPublisher<SellerEntity, CloudError> {
        let urlString = sellerBaseURL + String(sellerId)
        guard let url = URL(string: urlString) else {
            preconditionFailure("Bad Seller URL")
        }
        
        let request = URLRequest(url: url)
        
        return apiService.call(request, urlSession: session, type: SellerAPI.self)
            .map({ SellerWrapper.map(input: $0)})
            .eraseToAnyPublisher()
    }
}
