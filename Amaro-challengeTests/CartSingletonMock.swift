//
//  CartSingleton.swift
//  Amaro-challenge
//
//  Created by EquipeSuporteAplicacao on 5/8/19.
//  Copyright © 2019 Thufik. All rights reserved.
//

@testable import Amaro_challenge

class CartMock : CartProtocol{
    var products: [Product] = []
    
    func addProduct(product: Product) {
        products.append(product)
    }
    
    func getProducts() -> [Product] {
        return products
    }
    
    func removeProduct(at index: Int) {
        
    }
    
    func addQuantityToProduct(at index: Int) {
        
    }
    
    func removeQuantityToProduct(at index: Int) {
        
    }
}
