//
//  NumberFormatter+Extension.swift
//  MercadoLibreSearch
//
//  Created by Diego Andres Mazo Munoz on 14/06/21.
//

import Foundation

public extension NumberFormatter {
    static func numberFormatterWithLocale(for localeIdentifier: String) -> NumberFormatter {
        let numberFormatter = NumberFormatter()
        let locale = Locale(identifier: localeIdentifier)
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = locale
        
        return numberFormatter
    }
}
