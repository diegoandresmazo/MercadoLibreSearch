//
//  SellerWrapper.swift
//  MercadoLibreSearch
//
//  Created by Diego Andres Mazo Munoz on 13/06/21.
//

import Foundation

struct SellerWrapper {
    static func map(input: SellerAPI) -> SellerEntity {
        return SellerEntity(id: input.id, nickname: input.nickname, addressCity: input.city)
    }
}
