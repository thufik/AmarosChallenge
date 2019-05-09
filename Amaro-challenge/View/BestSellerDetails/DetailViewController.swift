//
//  DetailViewController.swift
//  Amaro-challenge
//
//  Created by EquipeSuporteAplicacao on 5/3/19.
//  Copyright © 2019 Thufik. All rights reserved.
//

import MKToolTip
import UIKit


class myButton: UIButton {
    var size : SizeEnum!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.black.cgColor
        self.setTitleColor(UIColor.black, for: .normal)
    }
}

class DetailViewController: UIViewController {
    
    @IBOutlet weak var productImageview: UIImageView!
    
    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var lblPrice: UILabel!
    
    @IBOutlet weak var lblInstallments: UILabel!
    
    @IBOutlet weak var lblColor: UILabel!
    
    @IBOutlet weak var btnAddToCart: UIButton!
    
    @IBOutlet weak var lblDiscountPrice: UILabel!
    
    @IBOutlet weak var lblDiscountPercentage: UILabel!
    
    @IBOutlet weak var btnPP: myButton!

    @IBOutlet weak var btnP: myButton!
    
    @IBOutlet weak var btnM: myButton!
    
    @IBOutlet weak var btnG: myButton!
    
    @IBOutlet weak var btnGG: myButton!
    
    var product : product!
    
    var currentsize : SizeEnum!
    
    lazy var cart = Cart.shared
    
    lazy var detailPresenter = BestSellerDetailsPresenter(detailView: self, cartSingleton: cart)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        btnAddToCart.layer.cornerRadius = 5
        btnAddToCart.layer.borderWidth = 2.0
        btnP.size = .P
        btnPP.size = .PP
        btnM.size = .M
        btnG.size = .G
        btnGG.size = .GG
        btnGG.addTarget(self, action: #selector(click(at:)), for: .touchUpInside)
        btnG.addTarget(self, action: #selector(click(at:)), for: .touchUpInside)
        btnM.addTarget(self, action: #selector(click(at:)), for: .touchUpInside)
        btnP.addTarget(self, action: #selector(click(at:)), for: .touchUpInside)
        btnPP.addTarget(self, action: #selector(click(at:)), for: .touchUpInside)
        
        detailPresenter.loadImage(stringURL: product.image)
        detailPresenter.loadInitialLabels(with: product)
    }
    
    @objc func click(at button : myButton){
        let clickedSize = button.size
        
        detailPresenter.clickButton(clickedSize: clickedSize!, product: product)
    }
    
    @IBAction func dismiss(_ sender: Any) {
        dismiss()
    }
    
    @IBAction func addToCart(_ sender: UIButton) {
        detailPresenter.addToCart(product: product)
    }
}

extension DetailViewController : DetailViewProtocol{
    func showBtnPPToolTip(identifier : String, title: String, message: String, preferences: ToolTipPreferences) {
        btnPP.showToolTip(identifier: identifier, title: title, message: message, button: nil, arrowPosition: .top, preferences: preferences, delegate: nil)
    }
    
    func showBtnPToolTip(identifier : String, title: String, message: String, preferences: ToolTipPreferences){
        btnP.showToolTip(identifier: identifier, title: title, message: message, button: nil, arrowPosition: .top, preferences: preferences, delegate: nil)
    }
    
    func showBtnMToolTip(identifier : String, title: String, message: String, preferences: ToolTipPreferences){
        btnM.showToolTip(identifier: identifier, title: title, message: message, button: nil, arrowPosition: .top, preferences: preferences, delegate: nil)
    }
    
    func showBtnGToolTip(identifier : String, title: String, message: String, preferences: ToolTipPreferences){
        btnG.showToolTip(identifier: identifier, title: title, message: message, button: nil, arrowPosition: .top, preferences: preferences, delegate: nil)
    }
    
    func showBtnGGToolTip(identifier : String, title: String, message: String, preferences: ToolTipPreferences){
        btnGG.showToolTip(identifier: identifier, title: title, message: message, button: nil, arrowPosition: .top, preferences: preferences, delegate: nil)
    }
    
    func setBtnPP(title color: UIColor, backGroundColor: UIColor) {
        btnPP.setTitleColor(color, for: .normal)
        btnPP.backgroundColor = backGroundColor
    }
    
    func setBtnP(title color: UIColor, backGroundColor: UIColor) {
        btnP.setTitleColor(color, for: .normal)
        btnP.backgroundColor = backGroundColor
    }
    
    func setBtnM(title color: UIColor, backGroundColor: UIColor) {
        btnM.setTitleColor(color, for: .normal)
        btnM.backgroundColor = backGroundColor
    }
    
    func setBtnG(title color: UIColor, backGroundColor: UIColor) {
        btnG.setTitleColor(color, for: .normal)
        btnG.backgroundColor = backGroundColor
    }
    
    func setBtnGG(title color: UIColor, backGroundColor: UIColor) {
        btnGG.setTitleColor(color, for: .normal)
        btnGG.backgroundColor = backGroundColor
    }
    
    func setNameLabel(nameFormatted: String) {
        lblName.text = nameFormatted
    }
    
    func setPriceLabel(priceFormatted: String) {
        lblPrice.text = priceFormatted
    }
    
    func setInstallmentsLabel(installmentsFormatted: String) {
        lblInstallments.text = installmentsFormatted
    }
    
    func setColorLabel(colorFormatted: String) {
        lblColor.text = colorFormatted
    }
    
    func setDiscountPriceLabel(discountPriceFormatted: NSMutableAttributedString) {
        lblDiscountPrice.attributedText = discountPriceFormatted
    }
    
    func setDiscountPricePercentage(discountPricePercentageFormatted: String) {
        lblDiscountPercentage.text = discountPricePercentageFormatted
    }
    
    func loadImage(image: UIImage) {
        productImageview.image = image
    }
    
    func loadImage(url : URL) {
        productImageview.af_setImage(withURL: url)
    }
    
    func dismiss(){
        self.dismiss(animated: true, completion: nil)
    }
    
    func showMessageWithError(){
        print("Erro")
    }
}
