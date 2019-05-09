//
//  BestSellerCollectionViewCell.swift
//  Amaro-challenge
//
//  Created by EquipeSuporteAplicacao on 5/2/19.
//  Copyright © 2019 Thufik. All rights reserved.
//

import INSPhotoGallery
import UIKit

class BestSellerCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var productImageView: UIImageView!
    
    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var lblActualPrice: UILabel!
    
    @IBOutlet weak var lblInstallments: UILabel!
    
    @IBOutlet weak var btnBuy: UIButton!
    
    var index : Int!
    
    var bestSellerPresenter : BestSellerPresenterProtocol!
    
    lazy var tap = UITapGestureRecognizer(target: self, action: #selector(self.tapOnImage(_:)))
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        btnBuy.layer.cornerRadius = 10
        btnBuy.layer.borderWidth = 2.0
        btnBuy.layer.borderColor = UIColor.black.cgColor
        productImageView.addGestureRecognizer(tap)
    }
    
    func load(index : Int, bestSellerPresenter : BestSellerPresenterProtocol){
        self.index = index
        self.bestSellerPresenter = bestSellerPresenter
        
        bestSellerPresenter.loadCell(at: index, cell: self)
    }
    
    @objc func tapOnImage(_ sender: UITapGestureRecognizer){
        let image = productImageView.image
        bestSellerPresenter.showImage(image: image)
    }
    
    @IBAction func tapOnBuy(_ sender: UIButton) {
        bestSellerPresenter.showView(at: index)
    }
}

extension BestSellerCollectionViewCell : BestSellerCollectionViewCellProtocol{
    func setNameLabel(text: String) {
        lblName.text = text
    }
    
    func setCurrentPriceLabel(text: String) {
        lblActualPrice.text = text
    }
    
    func setInstallmentsLabel(text: String) {
        lblInstallments.text = text
    }
    
    func setImageView(with image: UIImage) {
        productImageView.image = image
    }
    
    func setImageView(with url: URL) {
        productImageView.af_setImage(withURL: url)
    }
}
