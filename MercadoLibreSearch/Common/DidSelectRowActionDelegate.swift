//
//  DidSelectRowActionDelegate.swift
//  MercadoLibreSearch
//
//  Created by Diego Andres Mazo Munoz on 13/06/21.
//

import Foundation

public protocol DidSelectRowActionDelegate: AnyObject {
    func cellPressed(for position: Int)
}
