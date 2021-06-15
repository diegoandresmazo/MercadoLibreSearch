//
//  SearchWrapper.swift
//  MercadoLibreSearch
//
//  Created by Diego Andres Mazo Munoz on 10/06/21.
//

import Foundation

struct SearchWrapper {
    static func map(input: SearchAPI) -> SearchEntity {
        let products = input.products.map{ ProductWrapper.map(input: $0)}
        
        return SearchEntity(query: input.query, siteId: input.site_id, products: products)
    }
}
