//
//  ProductWrapper.swift
//  MercadoLibreSearch
//
//  Created by Diego Andres Mazo Munoz on 10/06/21.
//

import Foundation

struct ProductWrapper {
    static func map(input: ProductAPI) -> ProductEntity {
        guard let installmentsAPI = input.installments else {
            return ProductEntity(id: input.id, title: input.title, price: input.price, currencyId: input.currencyId, imageLink: input.imageLink, installments: nil, currency: nil)
        }
                
        let installments = InstallmentsWrapper.map(input: installmentsAPI)
        return ProductEntity(id: input.id, title: input.title, price: input.price, currencyId: input.currencyId, imageLink: input.imageLink, installments: installments, currency: nil)
    }
}
