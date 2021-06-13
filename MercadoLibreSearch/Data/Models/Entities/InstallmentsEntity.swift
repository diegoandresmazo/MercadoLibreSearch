//
//  InstallmentsEntity.swift
//  MercadoLibreSearch
//
//  Created by Diego Andres Mazo Munoz on 12/06/21.
//

import Foundation

public struct InstallmentsEntity: Equatable {
    let quantity: Int
    let amount: Double
    let rate: Int
    let currencyId: String
    
    public init(quantity: Int, amount: Double, rate: Int, currencyId: String) {
        self.quantity = quantity
        self.amount = amount
        self.rate = rate
        self.currencyId = currencyId
    }
}
