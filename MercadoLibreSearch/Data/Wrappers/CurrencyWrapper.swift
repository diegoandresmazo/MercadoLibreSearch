//
//  CurrencyWrapper.swift
//  MercadoLibreSearch
//
//  Created by Diego Andres Mazo Munoz on 10/06/21.
//

import Foundation

struct CurrencyWrapper {
    static func map(input: CurrencyAPI) -> CurrencyEntity {
        return CurrencyEntity(id: input.id, symbol: input.symbol, description: input.description, decimalPlaces: input.decimalPlaces)
    }
}
