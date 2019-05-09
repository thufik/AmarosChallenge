//
//  BestSellerDetailsPresenter.swift
//  Amaro-challenge
//
//  Created by EquipeSuporteAplicacao on 5/6/19.
//  Copyright © 2019 Thufik. All rights reserved.
//

import MKToolTip
import UIKit

class BestSellerDetailsPresenter: BestSellerDetailsPresenterProtocol {
    let sizesArray : [SizeEnum] = [.P,.PP,.M,.G,.GG]
    
    var detailView : DetailViewProtocol
    
    var cartSingleton : CartProtocol
    
    var currentSize : SizeEnum?
    
    init(detailView : DetailViewProtocol, cartSingleton : CartProtocol) {
        self.detailView = detailView
        self.cartSingleton = cartSingleton
    }
    
    func loadImage(stringURL: String) {
        if let url = URL(string: stringURL){
            detailView.loadImage(url: url)
        }else{
            let image = ImageEnum.unavailable.image()
            
            detailView.loadImage(image: image)
        }
    }
    
    func loadInitialLabels(with product : product){
        let color = "\(StringEnum.color.StringFormatted()) \(product.color)"
        let discountPercentage = "\(product.discount_percentage) \(StringEnum.off.StringFormatted())"
        let regularPrinceAttributeString: NSMutableAttributedString =  NSMutableAttributedString(string: product.regular_price)
        regularPrinceAttributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, regularPrinceAttributeString.length))
        
        detailView.setNameLabel(nameFormatted: product.name)
        detailView.setPriceLabel(priceFormatted: product.actual_price)
        detailView.setInstallmentsLabel(installmentsFormatted: product.installments)
        detailView.setColorLabel(colorFormatted: color)
        
        if product.on_sale{
            detailView.setDiscountPriceLabel(discountPriceFormatted: regularPrinceAttributeString)
            detailView.setDiscountPricePercentage(discountPricePercentageFormatted: discountPercentage)
        }
    }
    
    func addToCart(product : product){
        if let size = currentSize{
            let product = Product(name: product.name, price: product.actual_price, size: size, color: product.color, image: product.image, quantity: 1)
            cartSingleton.addProduct(product: product)
            
            detailView.dismiss()
        }else{
            detailView.showMessageWithError()
        }
    }
    
    func clickButton(clickedSize : SizeEnum, product : product){
        var available = true
        
        for size in product.sizes{
            if size.size == clickedSize.rawValue{
                if !size.available{
                    available = false
                    
                    showToolTip(clickedSize: clickedSize)
                }
            }
        }
        
        if available{
            currentSize = clickedSize
            
            checkButton(with: clickedSize)
            
            for size in sizesArray{
                if clickedSize != size{
                    changeBackGroundColor(size: size)
                }
            }
        }
    }
    
    private func createPreference() -> ToolTipPreferences{
        let gradientColor = ColorEnum.gradientColor1.color()
        let gradientColor2 = ColorEnum.gradientColor2.color()
        
        let preference = ToolTipPreferences()
        preference.drawing.bubble.gradientColors = [gradientColor, gradientColor2]
        preference.drawing.arrow.tipCornerRadius = 0
        preference.drawing.message.color = ColorEnum.black.color()
        preference.drawing.title.color = ColorEnum.red.color()
        
        return preference
    }
    
    private func showToolTip(clickedSize : SizeEnum){
        let preference = createPreference()
        
        switch clickedSize {
        case .PP:
            detailView.showBtnPPToolTip(identifier: "", title: StringEnum.titleUnavailable.StringFormatted(), message: StringEnum.messageUnavailable.StringFormatted(), preferences: preference)
        case .P:
            detailView.showBtnPToolTip(identifier: "", title: StringEnum.titleUnavailable.StringFormatted(), message: StringEnum.messageUnavailable.StringFormatted(), preferences: preference)
        case .M:
            detailView.showBtnMToolTip(identifier: "", title: StringEnum.titleUnavailable.StringFormatted(), message: StringEnum.messageUnavailable.StringFormatted(), preferences: preference)
        case .G:
            detailView.showBtnGToolTip(identifier: "", title: StringEnum.titleUnavailable.StringFormatted(), message: StringEnum.messageUnavailable.StringFormatted(), preferences: preference)
        case .GG:
            detailView.showBtnGGToolTip(identifier: "", title: StringEnum.titleUnavailable.StringFormatted(), message: StringEnum.messageUnavailable.StringFormatted(), preferences: preference)
        }
    }
    
    internal func checkButton(with size : SizeEnum){
        switch size {
        case .PP:
            detailView.setBtnPP(title: ColorEnum.white.color(), backGroundColor: ColorEnum.black.color())
            break
        case .P:
            detailView.setBtnP(title: ColorEnum.white.color(), backGroundColor: ColorEnum.black.color())
            break
        case .M:
            detailView.setBtnM(title: ColorEnum.white.color(), backGroundColor: ColorEnum.black.color())
            break
        case .G:
            detailView.setBtnG(title: ColorEnum.white.color(), backGroundColor: ColorEnum.black.color())
            break
        case .GG:
            detailView.setBtnGG(title: ColorEnum.white.color(), backGroundColor: ColorEnum.black.color())
            break
        }
    }
    
    internal func changeBackGroundColor(size : SizeEnum){
        switch size {
        case .PP:
            detailView.setBtnPP(title: ColorEnum.black.color(), backGroundColor: ColorEnum.white.color())
            break
        case .P:
            detailView.setBtnP(title: ColorEnum.black.color(), backGroundColor: ColorEnum.white.color())
            break
        case .M:
            detailView.setBtnM(title: ColorEnum.black.color(), backGroundColor: ColorEnum.white.color())
            break
        case .G:
            detailView.setBtnG(title: ColorEnum.black.color(), backGroundColor: ColorEnum.white.color())
            break
        case .GG:
            detailView.setBtnGG(title: ColorEnum.black.color(), backGroundColor: ColorEnum.white.color())
            break
        }
    }
}
