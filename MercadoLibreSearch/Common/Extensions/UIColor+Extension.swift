//
//  UIColor+Extension.swift
//  MercadoLibreSearch
//
//  Created by Diego Andres Mazo Munoz on 10/06/21.
//

import Foundation
import UIKit

extension UIColor {
    public convenience init?(hexString: String) {
        let red, green, blue, alpha: CGFloat
        var cString: String = hexString.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return nil
        }
        
        var rgbValue: UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        red = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
        green = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
        blue = CGFloat(rgbValue & 0x0000FF) / 255.0
        alpha = CGFloat(1.0)
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
        return
    }
    
    static public var mercadoMainColor: UIColor? {
        return UIColor(hexString: "ffe600")
    }
    
    static public var mercadoBackgroundColor: UIColor? {
        return UIColor(hexString: "f6f6f8")
    }
    
    static public var mercadoGrayColor: UIColor? {
        return UIColor(hexString: "3c3c3c")
    }
    
    static public var mercadoMediumGrayColor: UIColor? {
        return UIColor(hexString: "848484")
    }
    
    static public var mercadoLightGrayColor: UIColor? {
        return UIColor(hexString: "bdbdbd")
    }
    
    static public var mercadoDetailContainerColor: UIColor? {
        return UIColor(hexString: "ebebeb")
    }
    
    static public var mercadoGreenColor: UIColor? {
        return UIColor(hexString: "008f39")
    }
    
    static public var mercadoBlueColor: UIColor? {
        return UIColor(hexString: "0873c4")
    }
}
