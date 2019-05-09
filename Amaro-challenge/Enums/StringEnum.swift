//
//  StringEnum.swift
//  Amaro-challenge
//
//  Created by EquipeSuporteAplicacao on 5/6/19.
//  Copyright © 2019 Thufik. All rights reserved.
//

import Foundation

public enum StringEnum{
    case PictureUnavailable
    case color
    case off
    case titleUnavailable
    case messageUnavailable
    case emptyCart
    case EmptyCart
    case onlyPrice(String)
    case amoutWithTwoDecimalPoints(Double)
    case dearCustomer
    case cart
    case removeLastItem
    case notNow
    case yes
    case cartCell
    case cartTableViewCell
    case bestSellerCollectionViewCell
    case bestSellerCell
    case storyBoardMain
    case cartNavigationViewController
    case detailViewController
    case errorLoadImage
    case errorLoadMessage
    
    func StringFormatted() -> String {
        switch self {
        case .PictureUnavailable: return "PictureUnavailable"
        case .color: return NSLocalizedString("color", comment: "")
        case .off: return "OFF"
        case .titleUnavailable: return NSLocalizedString("unavailable", comment: "")
        case .messageUnavailable: return NSLocalizedString("unavailableAtTheMoment", comment: "")
        case .emptyCart: return NSLocalizedString("emptyCart", comment: "")
        case .EmptyCart: return "EmptyCart"
        case .onlyPrice(let price): return price.replacingOccurrences(of: "R$ ", with: "").replacingOccurrences(of: ",", with: ".")
        case .amoutWithTwoDecimalPoints(let amount): return String(format: "R$ %.02f", amount)
        case .dearCustomer: return NSLocalizedString("dearCustomer", comment: "")
        case .cart: return "Cart"
        case .removeLastItem: return NSLocalizedString("removeLastItem", comment: "")
        case .notNow: return NSLocalizedString("notNow", comment: "")
        case .yes: return NSLocalizedString("yes", comment: "")
        case .cartCell: return "cartCell"
        case .cartTableViewCell: return "CartTableViewCell"
        case .bestSellerCollectionViewCell: return "BestSellerCollectionViewCell"
        case .bestSellerCell: return "bestSellerCell"
        case .storyBoardMain: return "Main"
        case .cartNavigationViewController: return "cartNavigationViewController"
        case .detailViewController: return "detailViewController"
        case .errorLoadImage: return "ErrorLoad"
        case .errorLoadMessage : return NSLocalizedString("errorLoadMessage", comment: "")
        }
    }
}
