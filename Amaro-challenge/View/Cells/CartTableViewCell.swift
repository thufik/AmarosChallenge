//
//  CartTableViewCell.swift
//  Amaro-challenge
//
//  Created by EquipeSuporteAplicacao on 5/5/19.
//  Copyright © 2019 Thufik. All rights reserved.
//

import UIKit

class CartTableViewCell: UITableViewCell {

    @IBOutlet weak var cartImageView: UIImageView!
    
    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var lblSize: UILabel!
    
    @IBOutlet weak var lblColor: UILabel!
    
    @IBOutlet weak var lblQuantity: UILabel!
    
    @IBOutlet weak var lblAmount: UILabel!
    
    @IBOutlet weak var btnAdd: UIButton!
    
    @IBOutlet weak var btnRemove: UIButton!
    
    var index : Int!
    
    var product : Product!
    
    var cartPresenter : CartViewPresenterProtocol!
    
    override func awakeFromNib() {
        btnAdd.backgroundColor = UIColor.black
        btnRemove.backgroundColor = UIColor.black
    }
    
    func load(index : Int, cartPresenter : CartViewPresenterProtocol) {
        self.index = index
        self.cartPresenter = cartPresenter

        cartPresenter.loadCell(with: self, at: index)
    }

    @IBAction func add(_ sender: UIButton) {
        cartPresenter.updateAddProduct(at: index)
    }
    
    @IBAction func remove(_ sender: UIButton) {
        cartPresenter.updateRemoveProduct(at: index, bypass: false)
    }
}

extension CartTableViewCell : CartTableViewProtocol{
    func setNameLabel(text: String) {
        lblName.text = text
    }
    
    func setImage(with url: URL) {
        cartImageView.af_setImage(withURL: url)
    }
    
    func setImage(with image: UIImage) {
        cartImageView.image = image
    }
    
    func setSizeLabel(text: String) {
        lblSize.text = text
    }
    
    func setColorLabel(text: String) {
        lblColor.text = text
    }
    
    func setQuantityLabel(text: String) {
        lblQuantity.text = text
    }
    
    func setAmountLabel(text : String){
        lblAmount.text = text
    }
}
