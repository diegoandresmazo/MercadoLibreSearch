//
//  ProductDetailInfoEntity.swift
//  MercadoLibreSearch
//
//  Created by Diego Andres Mazo Munoz on 13/06/21.
//

import Foundation

public struct ProductDetailInfoEntity: Equatable {
    let imageLink: String
    let sellerId: Int
    var seller: SellerEntity?
    
    public init(imageLink: String, sellerId: Int, seller: SellerEntity?) {
        self.imageLink = imageLink
        self.sellerId = sellerId
        self.seller = seller
    }
}
