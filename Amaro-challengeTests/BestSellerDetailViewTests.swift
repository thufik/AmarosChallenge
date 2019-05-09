//
//  BestSellerDetailViewTests.swift
//  Amaro-challengeTests
//
//  Created by EquipeSuporteAplicacao on 5/6/19.
//  Copyright © 2019 Thufik. All rights reserved.
//

import MKToolTip
import XCTest
@testable import Amaro_challenge

class BestSellerDetailViewTests: XCTestCase {
    
    func testLoadImageWithEmptyImage(){
        let cartMock = CartMock()
        let detailViewMock = BestSellerDetailViewMock()
        let presenter = BestSellerDetailsPresenter(detailView: detailViewMock, cartSingleton: cartMock)
        
        presenter.loadImage(stringURL: "")
        
        XCTAssert(detailViewMock.loadImageWithImageWasCalled)
    }
    
    func testLoadImageValidURL(){
        let cartMock = CartMock()
        let detailViewMock = BestSellerDetailViewMock()
        let presenter = BestSellerDetailsPresenter(detailView: detailViewMock, cartSingleton: cartMock)
        
        presenter.loadImage(stringURL: "https://d3l7rqep7l31az.cloudfront.net/images/products/20002648_029_catalog_1.jpg?1459552552")
        
        XCTAssert(detailViewMock.loadImageWithURLWasCalled)
    }
    
    func testLoadInitialLabelsWithDiscount(){
        let cartMock = CartMock()
        let detailViewMock = BestSellerDetailViewMock()
        let presenter = BestSellerDetailsPresenter(detailView: detailViewMock, cartSingleton: cartMock)
        
        let productMock = product(name: "", style: "", code_color: "", color_slug: "", color: "", on_sale: true, regular_price: "", actual_price: "", discount_percentage: "", image: "", installments: "", sizes: [])
        
        presenter.loadInitialLabels(with: productMock)
        
        XCTAssert(detailViewMock.setNameLabelWasCalled)
        XCTAssert(detailViewMock.setPriceLabelWasCalled)
        XCTAssert(detailViewMock.setInstallmentsLabelWasCalled)
        XCTAssert(detailViewMock.setColorLabelWasCalled)
        XCTAssert(detailViewMock.setDiscountPricePercentageWasCalled)
        XCTAssert(detailViewMock.setDiscountPriceLabelWasCalled)
    }
    
    func testLoadInitialLabelsWithoutDiscount(){
        let cartMock = CartMock()
        let detailViewMock = BestSellerDetailViewMock()
        let presenter = BestSellerDetailsPresenter(detailView: detailViewMock, cartSingleton: cartMock)
        
        let productMock = product(name: "", style: "", code_color: "", color_slug: "", color: "", on_sale: false, regular_price: "", actual_price: "", discount_percentage: "", image: "", installments: "", sizes: [])
        
        presenter.loadInitialLabels(with: productMock)
        
        XCTAssert(detailViewMock.setNameLabelWasCalled)
        XCTAssert(detailViewMock.setPriceLabelWasCalled)
        XCTAssert(detailViewMock.setInstallmentsLabelWasCalled)
        XCTAssert(detailViewMock.setColorLabelWasCalled)
        XCTAssertFalse(detailViewMock.setDiscountPricePercentageWasCalled)
        XCTAssertFalse(detailViewMock.setDiscountPriceLabelWasCalled)
    }
    
    func testClickButtonAtSizeUnavailable(){
        let cartMock = CartMock()
        let detailViewMock = BestSellerDetailViewMock()
        let presenter = BestSellerDetailsPresenter(detailView: detailViewMock, cartSingleton: cartMock)
        let sizes = [size(available: false, size: SizeEnum.G.rawValue)]
        
        let testSize : SizeEnum = .G
        
        let productMock = product(name: "", style: "", code_color: "", color_slug: "", color: "", on_sale: false, regular_price: "", actual_price: "", discount_percentage: "", image: "", installments: "", sizes: sizes)
        
        presenter.clickButton(clickedSize: testSize, product: productMock)
        
        XCTAssert(detailViewMock.showBtnGTooltipWasCalled)
        XCTAssertNil(presenter.currentSize)
    }
    
    func testClickButtonAtSizeAvailable(){
        let cartMock = CartMock()
        let detailViewMock = BestSellerDetailViewMock()
        let presenter = BestSellerDetailsPresenter(detailView: detailViewMock, cartSingleton: cartMock)
        let sizes = [size(available: false, size: SizeEnum.G.rawValue)]
        
        let testSize : SizeEnum = .M
        
        let productMock = product(name: "", style: "", code_color: "", color_slug: "", color: "", on_sale: false, regular_price: "", actual_price: "", discount_percentage: "", image: "", installments: "", sizes: sizes)
        
        presenter.clickButton(clickedSize: testSize, product: productMock)
        
        XCTAssert(detailViewMock.setBtnPPWasCalled)
        XCTAssert(detailViewMock.setBtnPWasCalled)
        XCTAssert(detailViewMock.setBtnMWasCalled)
        XCTAssert(detailViewMock.setBtnGWasCalled)
        XCTAssert(detailViewMock.setBtnGGWasCalled)
        XCTAssertTrue(presenter.currentSize == testSize)
    }
    
    func testClickAddToCartWithoutChoosingSize(){
        let cartMock = CartMock()
        let detailViewMock = BestSellerDetailViewMock()
        let presenter = BestSellerDetailsPresenter(detailView: detailViewMock, cartSingleton: cartMock)
        let sizes = [size(available: false, size: SizeEnum.G.rawValue)]
        let productMock = product(name: "", style: "", code_color: "", color_slug: "", color: "", on_sale: false, regular_price: "", actual_price: "", discount_percentage: "", image: "", installments: "", sizes: sizes)
        
        presenter.addToCart(product: productMock)
        
        XCTAssertTrue(detailViewMock.showMessageWithErrorWasCalled)
    }
    
    func testClickAddToCartChoosingSizeBefore(){
        let cartMock = CartMock()
        let detailViewMock = BestSellerDetailViewMock()
        let presenter = BestSellerDetailsPresenter(detailView: detailViewMock, cartSingleton: cartMock)
        let sizes = [size(available: false, size: SizeEnum.G.rawValue)]
        
        let testSize : SizeEnum = .M
        
        let productMock = product(name: "", style: "", code_color: "", color_slug: "", color: "", on_sale: false, regular_price: "", actual_price: "", discount_percentage: "", image: "", installments: "", sizes: sizes)
        
        presenter.clickButton(clickedSize: testSize, product: productMock)
        presenter.addToCart(product: productMock)
        
        XCTAssertTrue(detailViewMock.dismissWasCalled)
        XCTAssertTrue(cartMock.getProducts().count == 1)
    }
}

class BestSellerDetailViewMock : DetailViewProtocol {
    var loadImageWithImageWasCalled = false
    var loadImageWithURLWasCalled = false
    var setNameLabelWasCalled = false
    var setPriceLabelWasCalled = false
    var setInstallmentsLabelWasCalled = false
    var setColorLabelWasCalled = false
    var setDiscountPriceLabelWasCalled = false
    var setDiscountPricePercentageWasCalled = false
    var setTooltipWasCalled = false
    var showBtnGTooltipWasCalled = false
    var setBtnPPWasCalled = false
    var setBtnPWasCalled = false
    var setBtnMWasCalled = false
    var setBtnGWasCalled = false
    var setBtnGGWasCalled = false
    var showMessageWithErrorWasCalled = false
    var dismissWasCalled = false
    
    func loadImage(url: URL) {
        loadImageWithURLWasCalled = true
    }
    
    func loadImage(image: UIImage) {
        loadImageWithImageWasCalled = true
    }
    
    func setNameLabel(nameFormatted: String) {
        setNameLabelWasCalled = true
    }
    
    func setPriceLabel(priceFormatted: String) {
        setPriceLabelWasCalled = true
    }
    
    func setInstallmentsLabel(installmentsFormatted: String) {
        setInstallmentsLabelWasCalled = true
    }
    
    func setColorLabel(colorFormatted: String) {
        setColorLabelWasCalled = true
    }
    
    func setDiscountPriceLabel(discountPriceFormatted: NSMutableAttributedString) {
        setDiscountPriceLabelWasCalled = true
    }
    
    func setDiscountPricePercentage(discountPricePercentageFormatted: String) {
        setDiscountPricePercentageWasCalled = true
    }
    
    func setBtnPP(title color: UIColor, backGroundColor: UIColor) {
        setBtnPPWasCalled = true
    }
    
    func setBtnP(title color: UIColor, backGroundColor: UIColor) {
        setBtnPWasCalled = true
    }
    
    func setBtnM(title color: UIColor, backGroundColor: UIColor) {
        setBtnMWasCalled = true
    }
    
    func setBtnG(title color: UIColor, backGroundColor: UIColor) {
        setBtnGWasCalled = true
    }
    
    func setBtnGG(title color: UIColor, backGroundColor: UIColor) {
        setBtnGGWasCalled = true
    }
    
    func showBtnPPToolTip(identifier: String, title: String, message: String, preferences: ToolTipPreferences) {
        
    }
    
    func showBtnPToolTip(identifier: String, title: String, message: String, preferences: ToolTipPreferences) {
        
    }
    
    func showBtnMToolTip(identifier: String, title: String, message: String, preferences: ToolTipPreferences) {
        
    }
    
    func showBtnGToolTip(identifier: String, title: String, message: String, preferences: ToolTipPreferences) {
        showBtnGTooltipWasCalled = true
    }
    
    func showBtnGGToolTip(identifier: String, title: String, message: String, preferences: ToolTipPreferences) {
        
    }
    
    func dismiss() {
        dismissWasCalled = true
    }
    
    func showMessageWithError() {
        showMessageWithErrorWasCalled = true
    }
}
