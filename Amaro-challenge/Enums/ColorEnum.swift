//
//  ColorEnum.swift
//  Amaro-challenge
//
//  Created by EquipeSuporteAplicacao on 5/7/19.
//  Copyright © 2019 Thufik. All rights reserved.
//

import Foundation
import UIKit

public enum ColorEnum{
    case white
    case black
    case red
    case gradientColor1
    case gradientColor2
    
    func color() -> UIColor{
        switch self {
        case .white: return UIColor.white
        case .black: return UIColor.black
        case .red: return UIColor.red
        case .gradientColor1: return UIColor(red: 0.886, green: 0.922, blue: 0.941, alpha: 1.000)
        case .gradientColor2: return UIColor(red: 0.812, green: 0.851, blue: 0.875, alpha: 1.000)
        }
    }
}
