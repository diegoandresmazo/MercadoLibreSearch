//
//  ProductsPresenterTests.swift
//  MercadoLibreSearchTests
//
//  Created by Diego Andres Mazo Munoz on 15/06/21.
//

import XCTest
@testable import MercadoLibreSearch

class ProductsPresenterTests: XCTestCase {
    let presenter = ProductsPresenter(productsService: ProductsServiceMock(), navigator: NavigatorMock())
    
    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testGetProducts() {
        let productsData = ProductsDataMock.getProductsDataMock()
        presenter.getProducts(for: "someQuery")
        
        XCTAssertEqual(presenter.products, productsData)
    }
}
