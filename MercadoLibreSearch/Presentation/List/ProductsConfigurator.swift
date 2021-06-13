//
//  ProductsConfigurator.swift
//  MercadoLibreSearch
//
//  Created by Diego Andres Mazo Munoz on 9/06/21.
//

import UIKit

public final class ProductsConfigurator {
    public static func getViewController(with apiService: APIServiceType) -> UIViewController {
        let presenter = ProductsPresenter(productsService: ProductsService(apiService: apiService))
        let viewController = ProductsViewController(presenter: presenter)
        viewController.modalPresentationStyle = .fullScreen
        
        return viewController
    }
}
