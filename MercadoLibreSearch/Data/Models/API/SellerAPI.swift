//
//  SellerAPI.swift
//  MercadoLibreSearch
//
//  Created by Diego Andres Mazo Munoz on 13/06/21.
//

import Foundation

public struct SellerAPI: Decodable {
    let id: Int
    let nickname: String
    let city: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case nickname
        case city
        case address
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let addressContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .address)
        
        id = try container.decode(Int.self, forKey: .id)
        nickname = try container.decode(String.self, forKey: .nickname)
        city = try addressContainer.decode(String.self, forKey: .city)
    }
}
