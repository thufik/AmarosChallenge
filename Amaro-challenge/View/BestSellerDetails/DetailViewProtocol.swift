//
//  DetailViewProtocol.swift
//  Amaro-challenge
//
//  Created by EquipeSuporteAplicacao on 5/6/19.
//  Copyright © 2019 Thufik. All rights reserved.
//

import MKToolTip
import UIKit

protocol DetailViewProtocol {
    func loadImage(url : URL)
    func loadImage(image : UIImage)
    func setNameLabel(nameFormatted : String)
    func setPriceLabel(priceFormatted : String)
    func setInstallmentsLabel(installmentsFormatted : String)
    func setColorLabel(colorFormatted : String)
    func setDiscountPriceLabel(discountPriceFormatted : NSMutableAttributedString)
    func setDiscountPricePercentage(discountPricePercentageFormatted : String)
    func setBtnPP(title color : UIColor, backGroundColor : UIColor)
    func setBtnP(title color : UIColor, backGroundColor : UIColor)
    func setBtnM(title color : UIColor, backGroundColor : UIColor)
    func setBtnG(title color : UIColor, backGroundColor : UIColor)
    func setBtnGG(title color : UIColor, backGroundColor : UIColor)
    func showBtnPPToolTip(identifier : String, title: String, message: String, preferences: ToolTipPreferences)
    func showBtnPToolTip(identifier : String, title: String, message: String, preferences: ToolTipPreferences)
    func showBtnMToolTip(identifier : String, title: String, message: String, preferences: ToolTipPreferences)
    func showBtnGToolTip(identifier : String, title: String, message: String, preferences: ToolTipPreferences)
    func showBtnGGToolTip(identifier : String, title: String, message: String, preferences: ToolTipPreferences)
    func dismiss()
    func showMessageWithError()
}
