//
//  NavigationConfigurator.swift
//  MercadoLibreSearch
//
//  Created by Diego Andres Mazo Munoz on 11/06/21.
//

import Foundation
import UIKit

public final class NavigationConfigurator {
    private let window: UIWindow
    private let rootNavigationController: UINavigationController
    private let apiService: APIServiceType
    
    public init(window: UIWindow, rootNavigationController: UINavigationController, apiService: APIServiceType) {
        self.window = window
        self.rootNavigationController = rootNavigationController
        self.apiService = apiService
    }

    public func start() {
        let productsViewController = ProductsConfigurator.getViewController(with: apiService)
        rootNavigationController.setViewControllers([productsViewController], animated: false)
        rootNavigationController.setNavigationBarHidden(true, animated: false)
        
        window.rootViewController = rootNavigationController
        window.makeKeyAndVisible()
    }
}

