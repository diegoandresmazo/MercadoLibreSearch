//
//  ProductDetailInfoWrapper.swift
//  MercadoLibreSearch
//
//  Created by Diego Andres Mazo Munoz on 13/06/21.
//

import Foundation

struct ProductDetailInfoWrapper {
    static func map(input: ProductDetailInfoAPI) -> ProductDetailInfoEntity {
        guard let imageLink = input.imagesLinks.first?.url else {
            return ProductDetailInfoEntity(imageLink: input.thumbnailLink, sellerId: input.sellerId, seller: nil)
        }
        
        return ProductDetailInfoEntity(imageLink: imageLink, sellerId: input.sellerId, seller: nil)
    }
}
