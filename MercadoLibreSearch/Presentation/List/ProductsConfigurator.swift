//
//  ProductsConfigurator.swift
//  MercadoLibreSearch
//
//  Created by Diego Andres Mazo Munoz on 9/06/21.
//

import UIKit

/**
 * Here, the Products view controller is configured with its respective presenter
 */
public final class ProductsConfigurator {
    
    static func getViewController(with apiService: APIServiceType, navigator: NavigatorType) -> UIViewController {
        
        let presenter = ProductsPresenter(productsService: ProductsService(apiService: apiService), navigator: navigator)
        let viewController = ProductsViewController(presenter: presenter)
        viewController.modalPresentationStyle = .fullScreen
        
        return viewController
    }
}
