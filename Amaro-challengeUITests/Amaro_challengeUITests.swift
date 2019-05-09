//
//  Amaro_challengeUITests.swift
//  Amaro-challengeUITests
//
//  Created by EquipeSuporteAplicacao on 5/2/19.
//  Copyright © 2019 Thufik. All rights reserved.
//

import Swifter
import XCTest

class Amaro_challengeUITests: XCTestCase {

    var app : XCUIApplication!
    
    lazy var server = HttpServer()
    
    override func setUp() {
        app = XCUIApplication()
    }

    override func tearDown() {
        server.stop()
        super.tearDown()
    }

    func testWithSuccessfullResponse() {
        server["/products"] = { request in
            let product = ["products" : [["name": "VESTIDO TRANSPASSE BOW", "style": "20002605", "code_color": "20002605_613","color_slug": "tapecaria","color": "TAPEÇARIA", "on_sale": false, "regular_price": "R$ 199,90","actual_price": "R$ 199,90","discount_percentage": "","installments": "3x R$ 66,63","image": "https://d3l7rqep7l31az.cloudfront.net/images/products/20002605_615_catalog_1.jpg?1460136912","sizes": [ ["available": false, "size": "PP", "sku": "5807_343_0_PP"], ["available": true, "size": "P","sku": "5807_343_0_P"], ["available": true, "size": "M", "sku": "5807_343_0_M"], ["available": true, "size": "G", "sku": "5807_343_0_G"], ["available": false,"size": "GG","sku": "5807_343_0_GG"]]]]]
            
            let jsonSuccess = product
            return HttpResponse.ok(.json(jsonSuccess as AnyObject))
        }
        
        try! server.start()
        
        app.launch()
        
        let lblName = app.cells.staticTexts["VESTIDO TRANSPASSE BOW"]
        let lblPrice = app.cells.staticTexts["R$ 199,90"]
        let lblInstallments = app.cells.staticTexts["3x R$ 66,63"]

        let exists = NSPredicate(format: "exists == 1")
        
        expectation(for: exists, evaluatedWith: lblName, handler: nil)
        expectation(for: exists, evaluatedWith: lblPrice, handler: nil)
        expectation(for: exists, evaluatedWith: lblInstallments, handler: nil)
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testWithErrorResponse(){
        server["/products"] = { request in
            return HttpResponse.internalServerError
        }
        
        try! server.start()
        
        app.launch()
        
        let lblErrorMessage = app.staticTexts["Erro ao carregar produtos!"]
        
        let exists = NSPredicate(format: "exists == 1")
        
        expectation(for: exists, evaluatedWith: lblErrorMessage, handler: nil)
        
        waitForExpectations(timeout: 5, handler: nil)
    }

}
