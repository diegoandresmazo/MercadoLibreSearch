//
//  EntityProduct.swift
//  MercadoLibreSearch
//
//  Created by Diego Andres Mazo Munoz on 10/06/21.
//

import Foundation

public struct ProductEntity: Equatable {
    let id: String
    let title: String
    let price: Double
    let currencyId: String
    let thumbnailLink: String
    let condition: ProductCondition
    let availableQuantity: Int
    let soldQuantity: Int
    let installments: InstallmentsEntity?
    var currency: CurrencyEntity?
    var detailInfo: ProductDetailInfoEntity?
    
    public init(id: String,
                title: String,
                price: Double,
                currencyId: String,
                thumbnailLink: String,
                condition: ProductCondition,
                availableQuantity: Int,
                soldQuantity: Int,
                installments: InstallmentsEntity?,
                currency: CurrencyEntity?,
                detailInfo: ProductDetailInfoEntity? = nil) {
        self.id = id
        self.title = title
        self.price = price
        self.currencyId = currencyId
        self.thumbnailLink = thumbnailLink
        self.condition = condition
        self.availableQuantity = availableQuantity
        self.soldQuantity = soldQuantity
        self.installments = installments
        self.currency = currency
        self.detailInfo = detailInfo
    }
}
