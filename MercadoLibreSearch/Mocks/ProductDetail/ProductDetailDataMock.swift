//
//  ProductDetailDataMock.swift
//  MercadoLibreSearch
//
//  Created by Diego Andres Mazo Munoz on 15/06/21.
//

import Foundation

class ProductDetailDataMock {
    
    static func getProdutWithoutDetailInfo() -> ProductEntity {
        let colombiaCurrency = CurrencyEntity(id: .COP, symbol: "$", description: "Peso colombiano", decimalPlaces: 0)
        
        return ProductEntity(id: "MCO616099115",
                             title: "Apple iPhone 11 (128 Gb) - Verde",
                             price: 2888999.0,
                             currencyId: "COP",
                             thumbnailLink: "http://http2.mlstatic.com/D_934344-MLA46153270455_052021-I.jpg",
                             condition: .new,
                             availableQuantity: 8,
                             soldQuantity: 3,
                             installments: InstallmentsEntity(quantity: 36, amount: 80249.97, rate: 0, currencyId: "COP"),
                             currency: colombiaCurrency,
                             detailInfo: nil)
    }
    
    static func getProductDetailInfoDataMock() -> ProductDetailInfoEntity {
        return ProductDetailInfoEntity(imageLink: "http://http2.mlstatic.com/D_934344-MLA46153270455_052021-O.jpg", sellerId: 146991177, seller: SellerEntity(id: 146991177, nickname: "FSL SOLUCIONES", addressCity: "Funza"))
    }
}
