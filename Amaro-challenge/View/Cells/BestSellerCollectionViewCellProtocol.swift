//
//  BestSellerCollectionViewProtocol.swift
//  Amaro-challenge
//
//  Created by EquipeSuporteAplicacao on 5/8/19.
//  Copyright © 2019 Thufik. All rights reserved.
//

import UIKit

protocol BestSellerCollectionViewCellProtocol {
    func setNameLabel(text : String)
    func setCurrentPriceLabel(text : String)
    func setInstallmentsLabel(text : String)
    func setImageView(with image : UIImage)
    func setImageView(with url : URL)
}
