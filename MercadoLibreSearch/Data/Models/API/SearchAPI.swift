//
//  APISearch.swift
//  MercadoLibreSearch
//
//  Created by Diego Andres Mazo Munoz on 10/06/21.
//

import Foundation

public struct SearchAPI: Codable {
    public let query: String
    public let site_id: String
    public let products: [ProductAPI]
    
    enum CodingKeys: String, CodingKey {
        case query
        case site_id
        case products = "results"
    }
}
