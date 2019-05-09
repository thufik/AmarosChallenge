//
//  CartTableViewProtocol.swift
//  Amaro-challenge
//
//  Created by EquipeSuporteAplicacao on 5/7/19.
//  Copyright © 2019 Thufik. All rights reserved.
//

import UIKit

protocol CartTableViewProtocol {
    func setAmountLabel(text : String)
    func setNameLabel(text : String)
    func setImage(with url : URL)
    func setImage(with image : UIImage)
    func setSizeLabel(text : String)
    func setColorLabel(text : String)
    func setQuantityLabel(text : String)
}
