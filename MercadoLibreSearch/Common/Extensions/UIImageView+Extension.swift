//
//  UIImageView+Extension.swift
//  MercadoLibreSearch
//
//  Created by Diego Andres Mazo Munoz on 10/06/21.
//

import Kingfisher
import UIKit

extension UIImageView {
    func setImageFromURL(_ url: URL?) {
        guard let url = url else {
            // TO-DO: Pensar en un error para esto
            print("Error, empty URL.")
            return
        }
        setupImageResource(ImageResource(downloadURL: url))
    }
    
    private func getKingfisherOptionsInfo() -> KingfisherOptionsInfo {
        return [
            .scaleFactor(UIScreen.main.scale),
            .transition(.fade(1)),
            .cacheOriginalImage,
        ]
    }
    
    private func setupImageResource(_ resource: Resource, placeHolder: Placeholder? = nil) {
        kf.indicatorType = .activity
        kf.setImage(
            with: resource,
            placeholder: placeHolder,
            options: getKingfisherOptionsInfo(),
            progressBlock: nil,
            completionHandler: { _ in })
    }
}
