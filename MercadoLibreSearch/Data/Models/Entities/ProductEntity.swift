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
    let imageLink: String
    let installments: InstallmentsEntity?
    var currency: CurrencyEntity?
    
    public init(id: String, title: String, price: Double, currencyId: String, imageLink: String, installments: InstallmentsEntity?, currency: CurrencyEntity?) {
        self.id = id
        self.title = title
        self.price = price
        self.currencyId = currencyId
        self.imageLink = imageLink
        self.installments = installments
        self.currency = currency
    }
}
