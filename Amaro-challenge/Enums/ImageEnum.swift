//
//  ImageEnum.swift
//  Amaro-challenge
//
//  Created by EquipeSuporteAplicacao on 5/6/19.
//  Copyright © 2019 Thufik. All rights reserved.
//

import Foundation

public enum ImageEnum{
    case unavailable
    case emptyCart
    case cart
    case errorLoad
    
    func image() -> UIImage{
        switch self {
        case .unavailable:
            guard let image = UIImage.init(named: StringEnum.PictureUnavailable.StringFormatted()) else{
                return UIImage.init()
            }
            
            return image
        case .emptyCart:
            guard let image = UIImage.init(named: StringEnum.EmptyCart.StringFormatted()) else{
                return UIImage.init()
            }
            
            return image
        case .cart:
            guard let image = UIImage.init(named: StringEnum.cart.StringFormatted()) else{
                return UIImage.init()
            }
            
            return image
        case .errorLoad:
            guard let image = UIImage.init(named: StringEnum.errorLoadImage.StringFormatted()) else{
                return UIImage.init()
            }
            
            return image
        }
    }
}
