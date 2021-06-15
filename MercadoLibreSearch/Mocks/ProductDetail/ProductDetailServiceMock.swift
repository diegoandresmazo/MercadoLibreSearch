//
//  ProductDetailServiceMock.swift
//  MercadoLibreSearch
//
//  Created by Diego Andres Mazo Munoz on 15/06/21.
//

import Foundation
import Combine

class ProductDetailServiceMock: ProductDetailServiceType {
    
    func getProductDetailInfo(for productId: String) -> AnyPublisher<ProductDetailInfoEntity, CloudError> {
        return Future<ProductDetailInfoEntity, CloudError> { promise in
            let productDetailInfo = ProductDetailDataMock.getProductDetailInfoDataMock()
            promise(.success(productDetailInfo))
        }.eraseToAnyPublisher()
    }
}
