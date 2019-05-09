//
//  CartSingletonProtocol.swift
//  Amaro-challenge
//
//  Created by EquipeSuporteAplicacao on 5/8/19.
//  Copyright © 2019 Thufik. All rights reserved.
//

import UIKit

protocol CartProtocol {
    var products : [Product] {get set}
    
    func addProduct(product : Product)
    func getProducts() -> [Product]
    func removeProduct(at index: Int)
    func addQuantityToProduct(at index : Int)
    func removeQuantityToProduct(at index : Int)
}
