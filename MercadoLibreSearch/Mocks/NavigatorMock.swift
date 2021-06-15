//
//  NavigatorMock.swift
//  MercadoLibreSearch
//
//  Created by Diego Andres Mazo Munoz on 15/06/21.
//

import Foundation
import UIKit

public final class NavigatorMock: NavigatorType {
    private let window: UIWindow = UIWindow()
    private let rootNavigationController = UINavigationController()
    private let apiService: APIServiceType = APIService()

    public func start() {}
    
    public func navigateToDetail(product: ProductEntity) {}
}
