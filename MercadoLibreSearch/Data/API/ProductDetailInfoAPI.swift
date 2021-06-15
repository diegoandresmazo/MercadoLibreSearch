//
//  ProductDetailAPI.swift
//  MercadoLibreSearch
//
//  Created by Diego Andres Mazo Munoz on 13/06/21.
//

import Foundation

/**
 * In ProductDetailInfoAPI we get extra information for the product, such as a new image with better resolution and the seller's identifier to later get the seller's data.
 */
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
