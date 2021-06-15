//
//  ProductDetailContract.swift
//  MercadoLibreSearch
//
//  Created by Diego Andres Mazo Munoz on 13/06/21.
//

import UIKit

protocol ProductDetailViewControllerType: AnyObject {
    func showProduct(_ product: ProductEntity)
    func showErrorRetrievingDetailInfo(for product: ProductEntity)
}

protocol ProductDetailPresenterType: AnyObject {
    func getProductDetailInfo(for productId: String)
}

protocol ProductDetailViewType: UIView {
    func configureView(with product: ProductEntity)
    func showErrorRetrievingDetailInfo(for product: ProductEntity)
}
