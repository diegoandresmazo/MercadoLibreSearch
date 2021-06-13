//
//  Error+Networking.swift
//  MercadoLibreSearch
//
//  Created by Diego Andres Mazo Munoz on 8/06/21.
//

import Foundation

public enum CloudError: Error {
    case decode(error: Error)
    
    public var errorDescription: String {
        switch self {
        case .decode(let error):
            return "Unable to parse JSON, error: \(error)"
        }
    }
}
