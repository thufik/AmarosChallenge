//
//  AlertEnum.swift
//  Amaro-challenge
//
//  Created by EquipeSuporteAplicacao on 5/7/19.
//  Copyright © 2019 Thufik. All rights reserved.
//

import SwiftEntryKit
import UIKit

enum AlertEnum {
    case removeLastAlert
    
    func attributes() -> EKAttributes{
        var attributes = EKAttributes.bottomFloat
        
        attributes.displayDuration = .infinity
        
        return attributes
    }
    
    func messageView(index : Int, cartPresenter : CartViewPresenterProtocol) -> EKAlertMessageView{
        let title = EKProperty.LabelContent(text: StringEnum.dearCustomer.StringFormatted(), style: .init(font: MainFont.medium.with(size: 15), color: ColorEnum.black.color()))
        
        let description = EKProperty.LabelContent(text: StringEnum.removeLastItem.StringFormatted(), style: .init(font: MainFont.light.with(size: 13), color: ColorEnum.black.color()))
        let image = EKProperty.ImageContent(imageName: StringEnum.cart.StringFormatted(), size: CGSize(width: 35, height: 35), contentMode: .scaleAspectFit)
        let simpleMessage = EKSimpleMessage(image: image, title: title, description: description)
        
        let buttonFont = MainFont.medium.with(size: 16)
        
        let closeButtonLabelStyle = EKProperty.LabelStyle(font: buttonFont, color: UIColor.white)
        let closeButtonLabel = EKProperty.LabelContent(text: StringEnum.notNow.StringFormatted(), style: closeButtonLabelStyle)
        let closeButton = EKProperty.ButtonContent(label: closeButtonLabel, backgroundColor: ColorEnum.red.color(), highlightedBackgroundColor:  ColorEnum.white.color()) {
            cartPresenter.dismissAlert()
        }
        
        let okButtonLabelStyle = EKProperty.LabelStyle(font: buttonFont, color: ColorEnum.black.color())
        let okButtonLabel = EKProperty.LabelContent(text: StringEnum.yes.StringFormatted(), style: okButtonLabelStyle)
        let okButton = EKProperty.ButtonContent(label: okButtonLabel, backgroundColor: ColorEnum.white.color(), highlightedBackgroundColor:  ColorEnum.black.color()) {
                cartPresenter.updateRemoveProduct(at: index, bypass: true)
        }
        let buttonsBarContent = EKProperty.ButtonBarContent(with: closeButton, okButton, separatorColor: ColorEnum.black.color(), buttonHeight: 60, expandAnimatedly: true)
        
        let alertMessage = EKAlertMessage(simpleMessage: simpleMessage, imagePosition: .left, buttonBarContent: buttonsBarContent)
        
        let contentView = EKAlertMessageView(with: alertMessage)
        
        return contentView
    }
    
}
