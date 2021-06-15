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
    let thumbnailLink: String
    let condition: ProductCondition
    let availableQuantity: Int
    let soldQuantity: Int
    let installments: InstallmentsAPI?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case price
        case currencyId = "currency_id"
        case thumbnailLink = "thumbnail"
        case condition
        case availableQuantity = "available_quantity"
        case soldQuantity = "sold_quantity"
        case installments
    }
}

public enum ProductCondition: String, Codable {
    case new = "Nuevo"
    case used = "Usado"
    case notSpecified = "Condición no especificada"
    
    enum CodingKeys: String, CodingKey {
        case new
        case used
        case notSpecified = "not_specified"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()

        switch try container.decode(String.self) {
        case "new": self = .new
        case "used": self = .used
        case "not_specified": self = .notSpecified
        default:
            self = .notSpecified
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .new: try container.encode("new")
        case .used: try container.encode("used")
        case .notSpecified: try container.encode("not_specified")
        }
    }
}
