//
//  BestSellerDetailsPresenterProtocol.swift
//  Amaro-challenge
//
//  Created by EquipeSuporteAplicacao on 5/6/19.
//  Copyright © 2019 Thufik. All rights reserved.
//

import UIKit

protocol BestSellerDetailsPresenterProtocol{
    func loadImage(stringURL : String)
    func loadInitialLabels(with product : product)
    func clickButton(clickedSize : SizeEnum, product : product)
    func addToCart(product : product)
    func checkButton(with size : SizeEnum)
    func changeBackGroundColor(size : SizeEnum)
}
