//
//  CartViewPresenterProtocol.swift
//  Amaro-challenge
//
//  Created by EquipeSuporteAplicacao on 5/7/19.
//  Copyright © 2019 Thufik. All rights reserved.
//

import UIKit

protocol CartViewPresenterProtocol {
    func updateRemoveProduct(at index: Int, bypass : Bool)
    func updateAddProduct(at index: Int)
    func getProductsCount() -> Int
    func getProduct(at index : Int) -> Product
    func loadCell(with cell : CartTableViewProtocol, at index : Int)
    func loadHeaderView(with headerView : CartHeaderViewProtocol)
    func dismissAlert()
}
