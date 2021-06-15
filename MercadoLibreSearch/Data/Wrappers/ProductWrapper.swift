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
            return ProductEntity(id: input.id,
                                 title: input.title,
                                 price: input.price,
                                 currencyId: input.currencyId,
                                 thumbnailLink: input.thumbnailLink,
                                 condition: input.condition,
                                 availableQuantity: input.availableQuantity,
                                 soldQuantity: input.soldQuantity,
                                 installments: nil,
                                 currency: nil)
        }
                
        let installments = InstallmentsWrapper.map(input: installmentsAPI)
        return ProductEntity(id: input.id,
                             title: input.title,
                             price: input.price,
                             currencyId: input.currencyId,
                             thumbnailLink: input.thumbnailLink,
                             condition: input.condition,
                             availableQuantity: input.availableQuantity,
                             soldQuantity: input.soldQuantity,
                             installments: installments,
                             currency: nil)
    }
}
