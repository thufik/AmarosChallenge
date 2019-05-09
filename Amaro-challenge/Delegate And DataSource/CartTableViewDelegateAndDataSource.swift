//
//  CartTableViewDelegateAndDataSource.swift
//  Amaro-challenge
//
//  Created by EquipeSuporteAplicacao on 5/8/19.
//  Copyright © 2019 Thufik. All rights reserved.
//

import UIKit

class CartTableViewDelegateAndDataSource: NSObject, UITableViewDelegate, UITableViewDataSource {
    var cartPresenter : CartViewPresenter
    
    init(with cartPresenter : CartViewPresenter) {
        self.cartPresenter = cartPresenter
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let cartHeaderview  = UINib(nibName: "CartHeaderView", bundle: Bundle.main).instantiate(withOwner: nil, options: nil).first as? CartHeaderView else {
            return UIView()
        }
        
        cartHeaderview.loadView(with: cartPresenter)
        
        return cartHeaderview
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartPresenter.getProductsCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cartCell = tableView.dequeueReusableCell(withIdentifier: "cartCell", for: indexPath) as? CartTableViewCell else{ return UITableViewCell() }
        
        cartCell.load(index: indexPath.row, cartPresenter: cartPresenter)
        
        return cartCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
