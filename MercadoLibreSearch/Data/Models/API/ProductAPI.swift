//
//  APIProduct.swift
//  MercadoLibreSearch
//
//  Created by Diego Andres Mazo Munoz on 8/06/21.
//

import Foundation

public struct ProductAPI: Codable {
    let id: String
    let title: String
    let price: Double
    let currencyId: String
    let imageLink: String
    let installments: InstallmentsAPI?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case price
        case currencyId = "currency_id"
        case imageLink = "thumbnail"
        case installments
    }
}
