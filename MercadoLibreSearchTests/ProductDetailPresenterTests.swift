//
//  ProductDetailPresenterTests.swift
//  MercadoLibreSearchTests
//
//  Created by Diego Andres Mazo Munoz on 15/06/21.
//

import XCTest
@testable import MercadoLibreSearch

class ProductDetailPresenterTests: XCTestCase {
    let presenter = ProductDetailPresenter(product: ProductDetailDataMock.getProdutWithoutDetailInfo(), productDetailService: ProductDetailServiceMock(), navigator: NavigatorMock())
    
    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testGetProductDetailInfo() {
        let productDetailInfo = ProductDetailDataMock.getProductDetailInfoDataMock()
        presenter.getProductDetailInfo(for: "someProductId")
        
        XCTAssertEqual(presenter.product.detailInfo, productDetailInfo)
    }
}
