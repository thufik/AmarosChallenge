//
//  Cart.swift
//  Amaro-challenge
//
//  Created by EquipeSuporteAplicacao on 5/3/19.
//  Copyright © 2019 Thufik. All rights reserved.
//

import UIKit

class Cart : CartProtocol {

    static let shared = Cart()
    
    internal var products : [Product] = []
    
    func addProduct(product : Product){
        var exists = false
        
        for (index, p) in products.enumerated(){
            if p.name == product.name && p.size == product.size{
                exists = true
                addQuantityToProduct(at: index)
            }
        }
        
        if exists == false {
            products.append(product)
        }
    }
    
    func getProducts() -> [Product]{
        return products
    }
    
    func removeProduct(at index: Int){
        products.remove(at: index)
    }
    
    func addQuantityToProduct(at index : Int){
        products[index].quantity = products[index].quantity + 1
    }
    
    func removeQuantityToProduct(at index : Int){
        products[index].quantity = products[index].quantity - 1
    }
    
}
