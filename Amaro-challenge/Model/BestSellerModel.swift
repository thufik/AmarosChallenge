//
//  BestSellerModel.swift
//  Amaro-challenge
//
//  Created by EquipeSuporteAplicacao on 5/2/19.
//  Copyright © 2019 Thufik. All rights reserved.
//


import Alamofire
import UIKit

class BestSellerModel: BestSellerModelProtocol {
    func    loadProducts(url: URL, successBlock: @escaping (_ products : products) -> Void, errorBlock: @escaping () -> Void) {

        Alamofire.request(url, method: .post, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in

            switch response.result{
            case .success( _):
                let decoder = JSONDecoder()

                if let data = response.data{
                    if let json = try? decoder.decode(products.self, from: data){
                        successBlock(json)
                    }else{
                        errorBlock()
                    }
                }
            case .failure( _):
                errorBlock()
            }
        }
    }
}
