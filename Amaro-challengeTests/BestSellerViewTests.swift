//
//  BestSellerViewTests.swift
//  Amaro-challengeTests
//
//  Created by EquipeSuporteAplicacao on 5/6/19.
//  Copyright © 2019 Thufik. All rights reserved.
//

import INSPhotoGallery
import XCTest
@testable import Amaro_challenge

class BestSellerViewTests: XCTestCase {
    func testInitialLoadingSuccess() {
        let viewMock = BestSellerViewMock()
        let modelMock = BestSellerModelMockSuccess()
        let cartMock = CartMock()
        
        let presenter = BestSellerPresenter(bestSellerView: viewMock, bestSellerModel: modelMock, cartSingleton: cartMock)
        
        presenter.loadProducts()
        
        XCTAssert(viewMock.callShowLoading)
        XCTAssert(viewMock.callHideLoading)
        XCTAssert(viewMock.callSetDelegate)
    }
    
    func testInitialLoadingError(){
        let viewMock = BestSellerViewMock()
        let modelMock = BestSellerModelMockError()
        let cartMock = CartMock()
        
        let presenter = BestSellerPresenter(bestSellerView: viewMock, bestSellerModel: modelMock, cartSingleton: cartMock)
        
        presenter.loadProducts()
        
        XCTAssert(viewMock.callShowLoading)
        XCTAssert(viewMock.callHideLoading)
        XCTAssert(viewMock.callShowError)
    }
    
    func testConfigureBadgeButtonWithoutProducts(){
        let viewMock = BestSellerViewMock()
        let modelMock = BestSellerModelMockSuccess()
        let cartMock = CartMock()
        
        let presenter = BestSellerPresenter(bestSellerView: viewMock, bestSellerModel: modelMock, cartSingleton: cartMock)
        
        presenter.configureNotificationBadge()
        
        XCTAssert(viewMock.callSetNotificationButton)
        XCTAssertNil(viewMock.badge)
    }
    
    func testConfigureBadgeButtonWitProducts(){
        let viewMock = BestSellerViewMock()
        let modelMock = BestSellerModelMockSuccess()
        let cartMock = CartMock()
        
        let product = Product(name: "", price: "", size: .G, color: "", image: "", quantity: 1)
        
        cartMock.addProduct(product: product)
        
        let presenter = BestSellerPresenter(bestSellerView: viewMock, bestSellerModel: modelMock, cartSingleton: cartMock)
        
        presenter.configureNotificationBadge()
        
        XCTAssert(viewMock.callSetNotificationButton)
        XCTAssertNotNil(viewMock.badge)
    }
}

class BestSellerViewMock : BestSellerViewProtocol {
    var callSetDelegate = false
    var callShowLoading = false
    var callHideLoading = false
    var callShowError = false
    var callSetNotificationButton = false
    var callRegisterNib = false
    var badge : String?
    
    func showLoading() {
        callShowLoading = true
    }
    
    func hideLoading() {
        callHideLoading = true
    }
    
    func showError() {
        callShowError = true
    }
    
    func setDelegateAndDataSource() {
        callSetDelegate = true
    }
    
    func registerNib() {
        callRegisterNib = true
    }
    
    func showDetailView(product: product) {
        
    }
    
    func showImage(photoView: INSPhotosViewController) {
        
    }
    
    func setNotificationButton(with badge: String?) {
        callSetNotificationButton = true
        self.badge = badge
    }
}

class BestSellerModelMockSuccess: BestSellerModelProtocol {
    func loadProducts(url: URL, successBlock: @escaping (products) -> Void, errorBlock: @escaping () -> Void) {
        let productMock = product(name: "", style: "", code_color: "", color_slug: "", color: "", on_sale: false, regular_price: "", actual_price: "", discount_percentage: "", image: "", installments: "", sizes: [size(available: false, size: "")])
        
        let productsMock  = products(products: [productMock])
        
        successBlock(productsMock)
    }
}

class BestSellerModelMockError: BestSellerModelProtocol {
    func loadProducts(url: URL, successBlock: @escaping (products) -> Void, errorBlock: @escaping () -> Void) {
        errorBlock()
    }
}
