//
//  ProductsDataMock.swift
//  MercadoLibreSearch
//
//  Created by Diego Andres Mazo Munoz on 15/06/21.
//

import Foundation

class ProductsDataMock {
    
    static func getProductsDataMock() -> [ProductEntity] {
        var products = [ProductEntity]()
        let colombiaCurrency = CurrencyEntity(id: .COP, symbol: "$", description: "Peso colombiano", decimalPlaces: 0)
        
        let product1 = ProductEntity(id: "MCO616099115",
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
        products.append(product1)
        
        let product2 = ProductEntity(id: "MCO608688814",
                                     title: "Apple iPhone 12 Pro Max (256 Gb) - Oro",
                                     price: 5100000.0, currencyId: "COP",
                                     thumbnailLink: "http://http2.mlstatic.com/D_888919-MLA46183755250_052021-I.jpg",
                                     condition: .new,
                                     availableQuantity: 1,
                                     soldQuantity: 2,
                                     installments: InstallmentsEntity(quantity: 36, amount: 141666.67, rate: 0, currencyId: "COP"),
                                     currency: colombiaCurrency,
                                     detailInfo: nil)
        products.append(product2)
        
        let product3 = ProductEntity(id: "MCO631283996",
                                     title: "Apple iPhone 12 Pro Max (128 Gb) - Oro",
                                     price: 5000000.0,
                                     currencyId: "COP",
                                     thumbnailLink: "http://http2.mlstatic.com/D_887163-MLA46183755191_052021-I.jpg",
                                     condition: .new,
                                     availableQuantity: 3,
                                     soldQuantity: 0,
                                     installments: InstallmentsEntity(quantity: 12, amount: 416666.67, rate: 0, currencyId: "COP"),
                                     currency: colombiaCurrency, detailInfo: nil)
        products.append(product3)
        
        return products
    }
}
