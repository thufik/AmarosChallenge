//
//  BestSellerModelProtocol.swift
//  Amaro-challenge
//
//  Created by EquipeSuporteAplicacao on 5/2/19.
//  Copyright © 2019 Thufik. All rights reserved.
//

import UIKit

protocol BestSellerModelProtocol {
    func loadProducts(url: URL, successBlock: @escaping (_ products : products) -> Void, errorBlock: @escaping () -> Void)
}
