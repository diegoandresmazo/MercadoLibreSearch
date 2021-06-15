//
//  SellerEntity.swift
//  MercadoLibreSearch
//
//  Created by Diego Andres Mazo Munoz on 13/06/21.
//

import Foundation

public struct SellerEntity: Equatable {
    let id: Int
    let nickname: String
    let addressCity: String
    
    public init(id: Int, nickname: String, addressCity: String) {
        self.id = id
        self.nickname = nickname
        self.addressCity = addressCity
    }
}
