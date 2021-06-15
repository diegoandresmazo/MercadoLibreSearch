//
//  ProductDetailConfigurator.swift
//  MercadoLibreSearch
//
//  Created by Diego Andres Mazo Munoz on 13/06/21.
//

import UIKit

public final class ProductDetailConfigurator {
    
    static func getViewController(for product: ProductEntity, with apiService: APIServiceType, navigator: NavigatorType) -> UIViewController {
        
        let presenter = ProductDetailPresenter(product: product, productDetailService: ProductDetailService(apiService: apiService), navigator: navigator)
        let viewController = ProductDetailViewController(presenter: presenter)
        viewController.modalPresentationStyle = .fullScreen
        
        return viewController
    }
}
