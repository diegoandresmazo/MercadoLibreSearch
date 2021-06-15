//
//  InstallmentsAPI.swift
//  MercadoLibreSearch
//
//  Created by Diego Andres Mazo Munoz on 12/06/21.
//

import Foundation

public struct InstallmentsAPI: Codable {
    let quantity: Int
    let amount: Double
    let rate: Int
    let currencyId: String
    
    enum CodingKeys: String, CodingKey {
        case quantity
        case amount
        case rate
        case currencyId = "currency_id"
    }
}
