//
//  ProductDetailAPI.swift
//  MercadoLibreSearch
//
//  Created by Diego Andres Mazo Munoz on 13/06/21.
//

import Foundation

public struct ProductDetailInfoAPI: Codable {
    let sellerId: Int
    let thumbnailLink: String
    let imagesLinks: [DetailInfoPictureAPI]
    
    enum CodingKeys: String, CodingKey {
        case sellerId = "seller_id"
        case thumbnailLink = "thumbnail"
        case imagesLinks = "pictures"
    }
}

public struct DetailInfoPictureAPI: Codable {
    let url: String
}
