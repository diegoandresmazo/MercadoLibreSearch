//
//  EntityCurrency.swift
//  MercadoLibreSearch
//
//  Created by Diego Andres Mazo Munoz on 10/06/21.
//

import Foundation

public struct CurrencyEntity: Equatable {
    let id: CurrencyLocale
    let symbol: String
    let description: String
    let decimalPlaces: Int
    
    public init(id: CurrencyLocale, symbol: String, description: String, decimalPlaces: Int) {
        self.id = id
        self.symbol = symbol
        self.description = description
        self.decimalPlaces = decimalPlaces
    }
}
