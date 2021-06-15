//
//  APICurrency.swift
//  MercadoLibreSearch
//
//  Created by Diego Andres Mazo Munoz on 10/06/21.
//

import Foundation

public struct CurrencyAPI: Codable {
    let id: CurrencyLocale
    let symbol: String
    let description: String
    let decimalPlaces: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case symbol
        case description
        case decimalPlaces = "decimal_places"
    }
}

public enum CurrencyLocale: String, Codable {
    case PYG = "es_PY"
    case UYU = "es_UY"
    case NIO = "es_NI"
    case COP = "es_CO"
    case PEN = "es_PE"
    case ARS = "es_AR"
    case CLP = "es_CL"
    case CRC = "es_CR"
    case USD = "es_SV"
    case PAB = "es_PA"
    case VES = "es_VE"
    case CUP = "es_CU"
    case GTQ = "es_GT"
    case MXN = "es_MX"
    case BOB = "es_BO"
    case BRL = "pt_BR"
    case DOP = "es_DO"
    case HNL = "es_HN"
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()

        switch try container.decode(String.self) {
        case "PYG": self = .PYG
        case "UYU": self = .UYU
        case "NIO": self = .NIO
        case "COP": self = .COP
        case "PEN": self = .PEN
        case "ARS": self = .ARS
        case "CLP": self = .CLP
        case "CRC": self = .CRC
        case "USD": self = .USD
        case "PAB": self = .PAB
        case "VES": self = .VES
        case "CUP": self = .CUP
        case "GTQ": self = .GTQ
        case "MXN": self = .MXN
        case "BOB": self = .BOB
        case "BRL": self = .BRL
        case "DOP": self = .DOP
        case "HNL": self = .HNL
        default:
            fatalError()
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .PYG: try container.encode("PYG")
        case .UYU: try container.encode("UYU")
        case .NIO: try container.encode("NIO")
        case .COP: try container.encode("COP")
        case .PEN: try container.encode("PEN")
        case .ARS: try container.encode("ARS")
        case .CLP: try container.encode("CLP")
        case .CRC: try container.encode("CRC")
        case .USD: try container.encode("USD")
        case .PAB: try container.encode("PAB")
        case .VES: try container.encode("VES")
        case .CUP: try container.encode("CUP")
        case .GTQ: try container.encode("GTQ")
        case .MXN: try container.encode("MXN")
        case .BOB: try container.encode("BOB")
        case .BRL: try container.encode("BRL")
        case .DOP: try container.encode("DOP")
        case .HNL: try container.encode("HNL")
        }
    }
}
