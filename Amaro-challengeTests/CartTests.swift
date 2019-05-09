//
//  CartTests.swift
//  Amaro-challengeTests
//
//  Created by EquipeSuporteAplicacao on 5/8/19.
//  Copyright © 2019 Thufik. All rights reserved.
//

import SwiftEntryKit
import XCTest
@testable import Amaro_challenge

class CartTests: XCTestCase {
    
    func testAddProductToCartWithOneProduct(){
        let cart = CartMock()
        let carView = CartViewMock()
        let nameTest = "teste"
        let priceTest = "R$ 190,0"
        let sizeTest : SizeEnum = .G
        let colorTest = "Preto"
        let imageTest = "http://imageTest"
        let quantityTest = 1
        
        let productMock = Product(name: nameTest, price: priceTest, size: sizeTest, color: colorTest, image: imageTest, quantity: quantityTest)
        
        cart.addProduct(product: productMock)
        
        let presenter = CartViewPresenter(cartView: carView, cartSingleton: cart)
    
        XCTAssertTrue(presenter.getProductsCount() == 1)
        XCTAssertNoThrow(presenter.getProduct(at: 0))
        
        let product = presenter.getProduct(at: 0)
        
        XCTAssertTrue(product.name.compare(nameTest) == .orderedSame)
        XCTAssertTrue(product.color.compare(colorTest) == .orderedSame)
        XCTAssertTrue(product.image.compare(imageTest) == .orderedSame)
        XCTAssertTrue(product.size == sizeTest)
        XCTAssertTrue(product.quantity == quantityTest)
    }
    
    func testAddOneValueToCartWithOneProduct(){
        let cart = CartMock()
        let carView = CartViewMock()
        let nameTest = "teste"
        let priceTest = "R$ 190,0"
        let sizeTest : SizeEnum = .G
        let colorTest = "Preto"
        let imageTest = "http://imageTest"
        let quantityTest = 1
        
        let productMock = Product(name: nameTest, price: priceTest, size: sizeTest, color: colorTest, image: imageTest, quantity: quantityTest)
        
        cart.addProduct(product: productMock)
        
        let presenter = CartViewPresenter(cartView: carView, cartSingleton: cart)
        
        presenter.updateAddProduct(at: 0)
        
        XCTAssertTrue(presenter.getProductsCount() == 1)
        XCTAssertNoThrow(presenter.getProduct(at: 0))
        
        let product = presenter.getProduct(at: 0)
        
        XCTAssertTrue(product.quantity == 2)
        XCTAssertTrue(carView.reloadTableViewWasCalled)
    }
    
    func testRemoveOneValueToCartWithOneProduct(){
        let cart = CartMock()
        let carView = CartViewMock()
        let nameTest = "teste"
        let priceTest = "R$ 190,0"
        let sizeTest : SizeEnum = .G
        let colorTest = "Preto"
        let imageTest = "http://imageTest"
        let quantityTest = 1
        
        let productMock = Product(name: nameTest, price: priceTest, size: sizeTest, color: colorTest, image: imageTest, quantity: quantityTest)
        
        cart.addProduct(product: productMock)
        
        let presenter = CartViewPresenter(cartView: carView, cartSingleton: cart)
        
        presenter.updateRemoveProduct(at: 0, bypass: false)
        
        XCTAssertTrue(carView.alertMessageWasCalled)
    }
    
    func testRemoveOneValueToCartWithOneProductAfterMessage(){
        let cart = CartMock()
        let carView = CartViewMock()
        let nameTest = "teste"
        let priceTest = "R$ 190,0"
        let sizeTest : SizeEnum = .G
        let colorTest = "Preto"
        let imageTest = "http://imageTest"
        let quantityTest = 1
        
        let productMock = Product(name: nameTest, price: priceTest, size: sizeTest, color: colorTest, image: imageTest, quantity: quantityTest)
        
        cart.addProduct(product: productMock)
        
        let presenter = CartViewPresenter(cartView: carView, cartSingleton: cart)
        
        presenter.updateRemoveProduct(at: 0, bypass: true)
        
        XCTAssertTrue(carView.reloadTableViewWasCalled)
        XCTAssertTrue(carView.dismissWasCalled)
        
        XCTAssertTrue(presenter.getProductsCount() == 0)
    }
    
    func testRemoveOneValueToCartWhenCartHasMoreThanOneProduct(){
        let cart = CartMock()
        let carView = CartViewMock()
        let nameTest = "teste"
        let priceTest = "R$ 190,0"
        let sizeTest : SizeEnum = .G
        let colorTest = "Preto"
        let imageTest = "http://imageTest"
        let quantityTest = 2
        
        let productMock = Product(name: nameTest, price: priceTest, size: sizeTest, color: colorTest, image: imageTest, quantity: quantityTest)
        
        cart.addProduct(product: productMock)
        
        let presenter = CartViewPresenter(cartView: carView, cartSingleton: cart)
        
        presenter.updateRemoveProduct(at: 0, bypass: true)
        
        XCTAssertTrue(carView.reloadTableViewWasCalled)
        
        XCTAssertTrue(presenter.getProductsCount() == 1)
        XCTAssertNoThrow(presenter.getProduct(at: 0))
        
        let product = presenter.getProduct(at: 0)
        
        XCTAssertTrue(product.quantity == 1)
    }
    
    func testLoadHeaderView(){
        let cart = CartMock()
        let carView = CartViewMock()
        let cartHeaderView = CartHeaderViewMock()
        
        let presenter = CartViewPresenter(cartView: carView, cartSingleton: cart)
        
        presenter.loadHeaderView(with: cartHeaderView)
        
        XCTAssertTrue(cartHeaderView.setAmountLabelWasCalled)
    }
}

class CartViewMock : CartViewProtocol{
    var alertMessageWasCalled = false
    var reloadTableViewWasCalled = false
    var dismissWasCalled = false
    
    func showAlertMessage(message contentView: EKAlertMessageView, attributes: EKAttributes) {
        alertMessageWasCalled = true
    }
    
    func reloadTableview() {
        reloadTableViewWasCalled = true
    }
    
    func dismissAlert() {
        dismissWasCalled = true
    }
}


class CartHeaderViewMock : CartHeaderViewProtocol{
    var setAmountLabelWasCalled = false
    
    func loadView(with cartPresenter: CartViewPresenterProtocol) {
        
    }
    
    func setAmountLabel(value: String) {
        setAmountLabelWasCalled = true
    }
}
