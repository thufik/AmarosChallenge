//
//  URLEnum.swift
//  Amaro-challenge
//
//  Created by EquipeSuporteAplicacao on 5/9/19.
//  Copyright © 2019 Thufik. All rights reserved.
//

import UIKit

enum URLEnum{
    case baseURL
    
    func url() -> URL{
        guard let baseURLString = Bundle.main.object(forInfoDictionaryKey: "base_url") as? String else{
            return URL(fileURLWithPath: "")
        }
        
        guard let url = URL(string: baseURLString) else{
            return URL(fileURLWithPath: "")
        }
        
        return url
    }
}
