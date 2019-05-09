//
//  BestSellerPresenterProtocol.swift
//  Amaro-challenge
//
//  Created by EquipeSuporteAplicacao on 5/2/19.
//  Copyright © 2019 Thufik. All rights reserved.
//

import UIKit

protocol BestSellerPresenterProtocol {
    func loadProducts()
    func configureNotificationBadge()
    func showImage(image : UIImage?)
    func loadCell(at index : Int, cell bestSellerCollectionCell : BestSellerCollectionViewCellProtocol)
    func showView(at index : Int)
    func getProductsCount() -> Int
}
