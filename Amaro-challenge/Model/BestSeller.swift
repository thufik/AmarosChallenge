//
//  BestSeller.swift
//  Amaro-challenge
//
//  Created by EquipeSuporteAplicacao on 5/2/19.
//  Copyright © 2019 Thufik. All rights reserved.
//

import UIKit

struct products : Codable {
    var products : [product]
}

public struct product : Codable {
    var name : String
    var style : String
    var code_color : String
    var color_slug : String
    var color : String
    var on_sale : Bool
    var regular_price : String
    var actual_price : String
    var discount_percentage : String
    var image : String
    var installments : String
    var sizes : [size]
}

struct size : Codable{
    var available : Bool
    var size : String
}
