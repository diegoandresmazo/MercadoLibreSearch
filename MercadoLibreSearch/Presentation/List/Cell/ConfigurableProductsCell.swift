//
//  ConfigurableCell.swift
//  MercadoLibreSearch
//
//  Created by Diego Andres Mazo Munoz on 9/06/21.
//

import UIKit

public protocol ConfigurableProductsCell: AnyObject {
    static var reuseIdentifier: String { get }
    func configure(with data: ProductsTableViewCellModel)
}

extension ConfigurableProductsCell {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

public struct ProductsTableViewSectionModel {
    var title: String
    var data: [ProductsTableViewCellModel]
}

public struct ProductsTableViewCellModel: Equatable {
    var name: String
    var price: Double
    var installments: InstallmentsEntity?
    var currency: CurrencyEntity?
    var thumbnailLink: String
}
