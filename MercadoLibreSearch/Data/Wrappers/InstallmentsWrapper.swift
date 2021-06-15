//
//  InstallmentsWrapper.swift
//  MercadoLibreSearch
//
//  Created by Diego Andres Mazo Munoz on 12/06/21.
//

import Foundation

struct InstallmentsWrapper {
    static func map(input: InstallmentsAPI) -> InstallmentsEntity {
        return InstallmentsEntity(quantity: input.quantity, amount: input.amount, rate: input.rate, currencyId: input.currencyId)
    }
}
