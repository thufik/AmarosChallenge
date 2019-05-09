//
//  CartHeaderViewProtocol.swift
//  Amaro-challenge
//
//  Created by EquipeSuporteAplicacao on 5/7/19.
//  Copyright © 2019 Thufik. All rights reserved.
//

import UIKit

protocol CartHeaderViewProtocol {
    func loadView(with cartPresenter : CartViewPresenterProtocol)
    func setAmountLabel(value : String)
}
