//
//  CartHeaderView.swift
//  Amaro-challenge
//
//  Created by EquipeSuporteAplicacao on 5/5/19.
//  Copyright © 2019 Thufik. All rights reserved.
//

import UIKit

class CartHeaderView: UIView {
    @IBOutlet weak var lblAmount: UILabel!
}

extension CartHeaderView : CartHeaderViewProtocol{
    func setAmountLabel(value : String){
        lblAmount.text = value
    }
    
    func loadView(with cartPresenter : CartViewPresenterProtocol){
        cartPresenter.loadHeaderView(with: self)
    }
}
