//
//  SearchEntity.swift
//  MercadoLibreSearch
//
//  Created by Diego Andres Mazo Munoz on 10/06/21.
//

import Foundation

public struct SearchEntity: Equatable {
    let query: String
    let siteId: String
    let products: [ProductEntity]
    
    public init(query: String, siteId: String, products: [ProductEntity]) {
        self.query = query
        self.siteId = siteId
        self.products = products
    }
}
