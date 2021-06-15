//
//  ProductDetailPresenter.swift
//  MercadoLibreSearch
//
//  Created by Diego Andres Mazo Munoz on 13/06/21.
//

import Combine
import os.log

final class ProductDetailPresenter {
    weak var view: ProductDetailViewControllerType?
    private var product: ProductEntity
    private var productDetailService: ProductDetailServiceType
    private var navigator: Navigator
    private var cancellable: Set<AnyCancellable> = Set<AnyCancellable>()
    
    init(product: ProductEntity, productDetailService: ProductDetailServiceType, navigator: Navigator) {
        self.product = product
        self.productDetailService = productDetailService
        self.navigator = navigator
    }
    
    func viewDidLoad() {
        self.view?.showProduct(product)
        getProductDetailInfo(for: product.id)
    }
}

extension ProductDetailPresenter: ProductDetailPresenterType {
    func getProductDetailInfo(for productId: String) {
        productDetailService.getProductDetailInfo(for: productId)
            .sink { [weak self]  errorCompletion in
                guard let self = self else { return }
                
                if case .failure(let err) = errorCompletion {
                    self.view?.showErrorRetrievingDetailInfo(for: self.product)
    
                    let logger = Logger.init(subsystem: "ProductDetailPresenter", category: "ProductDetailInfo")
                    logger.error("Error retrieving product DetailInfo: \(err.errorDescription)")
                }
        } receiveValue: { [weak self] productWithInfo in
            guard let self = self else { return }
            self.product.detailInfo = productWithInfo
            self.view?.showProduct(self.product)
        }.store(in: &cancellable)
    }
}
