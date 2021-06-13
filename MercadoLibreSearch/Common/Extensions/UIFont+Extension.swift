//
//  UIFont+Extension.swift
//  MercadoLibreSearch
//
//  Created by Diego Andres Mazo Munoz on 12/06/21.
//

import Foundation
import UIKit

public extension UIFont {
    static func mercadoFont(withSize size: CGFloat) -> UIFont {
        return UIFont(name: "Avenir-Roman", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    static func mercadoLight(withSize size: CGFloat) -> UIFont {
        return UIFont(name: "Avenir-Light", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    static func mercadoBlack(withSize size: CGFloat) -> UIFont {
        return UIFont(name: "Avenir-Black", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    static func mercadoHeavy(withSize size: CGFloat) -> UIFont {
        return UIFont(name: "Avenir-Heavy", size: size) ?? UIFont.systemFont(ofSize: size)
    }
}
