//
//  Navigator.swift
//  MercadoLibreSearch
//
//  Created by Diego Andres Mazo Munoz on 11/06/21.
//

import Foundation
import UIKit

protocol NavigatorType {
    func start()
    func navigateToDetail(product: ProductEntity)
}

public final class Navigator: NavigatorType {
    private let window: UIWindow
    private let rootNavigationController: UINavigationController
    private let apiService: APIServiceType
    
    public init(window: UIWindow, rootNavigationController: UINavigationController, apiService: APIServiceType) {
        self.window = window
        self.rootNavigationController = rootNavigationController
        self.apiService = apiService
    }

    public func start() {
        let productsViewController = ProductsConfigurator.getViewController(with: apiService, navigator: self)
        rootNavigationController.setViewControllers([productsViewController], animated: false)
        rootNavigationController.setNavigationBarHidden(true, animated: false)
        
        window.rootViewController = rootNavigationController
        window.makeKeyAndVisible()
    }
    
    public func navigateToDetail(product: ProductEntity) {
        let productDetailViewController = ProductDetailConfigurator.getViewController(for: product, with: apiService, navigator: self)
        rootNavigationController.setNavigationBarHidden(false, animated: false)
        rootNavigationController.pushViewController(productDetailViewController, animated: true)
    }
}
