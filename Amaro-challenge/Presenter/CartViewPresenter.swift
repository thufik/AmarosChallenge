//
//  CartViewPresenter.swift
//  Amaro-challenge
//
//  Created by EquipeSuporteAplicacao on 5/7/19.
//  Copyright © 2019 Thufik. All rights reserved.
//

import UIKit

class CartViewPresenter: CartViewPresenterProtocol {
    lazy var products = cartSingleton.getProducts()
    
    var cartView : CartViewProtocol
    
    var cartSingleton : CartProtocol
    
    init(cartView : CartViewProtocol, cartSingleton : CartProtocol) {
        self.cartView = cartView
        self.cartSingleton = cartSingleton
    }
    
    func updateRemoveProduct(at index: Int, bypass : Bool) {
        if (products[index].quantity == 1 && bypass == false){
            let attributes = AlertEnum.removeLastAlert.attributes()
            let contentView = AlertEnum.removeLastAlert.messageView(index: index, cartPresenter: self)
            
            cartView.showAlertMessage(message: contentView, attributes: attributes)
        }else if(products[index].quantity == 1 && bypass == true){
            cartSingleton.removeProduct(at: index)
            removeProduct(at: index)
            cartView.reloadTableview()
            cartView.dismissAlert()
        }else{
            cartSingleton.removeQuantityToProduct(at : index)
            removeOne(at: index)
            cartView.reloadTableview()
        }
    }
    
    func updateAddProduct(at index: Int) {
        cartSingleton.addQuantityToProduct(at : index)
        AddOne(at: index)
        cartView.reloadTableview()
    }
    
    func getProductsCount() -> Int{
        return products.count
    }
    
    func getProduct(at index : Int) -> Product{
        return products[index]
    }
    
    func loadCell(with cell : CartTableViewProtocol, at index : Int) {
        let product = getProduct(at: index)
        
        let productPriceString = StringEnum.onlyPrice(product.price).StringFormatted()
        
        if let productPriceDouble = Double(productPriceString){
            let amount = productPriceDouble * Double(product.quantity)
            let amountFormatted = StringEnum.amoutWithTwoDecimalPoints(amount).StringFormatted()
            
            cell.setAmountLabel(text : amountFormatted)
        }
        
        cell.setNameLabel(text: product.name)
        cell.setSizeLabel(text: product.size.rawValue)
        cell.setColorLabel(text: product.color)
        cell.setQuantityLabel(text: String(product.quantity))
        
        if let url = URL(string: product.image){
            cell.setImage(with: url)
        }else{
            cell.setImage(with: ImageEnum.emptyCart.image())
        }
    }
    
    func loadHeaderView(with headerView : CartHeaderViewProtocol){
        var total : Double = 0.0
        
        for product in products{
            let productString = StringEnum.onlyPrice(product.price).StringFormatted()
            
            if let doubleProduct = Double(productString){
                let amount = doubleProduct * Double(product.quantity)
                
                total = total + amount
            }
        }

        let amountFormatted = StringEnum.amoutWithTwoDecimalPoints(total).StringFormatted()
        
        headerView.setAmountLabel(value: amountFormatted)
    }
    
    func dismissAlert() {
        cartView.dismissAlert()
    }
    
    private func AddOne(at index : Int){
        products[index].quantity = products[index].quantity + 1
    }
    
    private func removeOne(at index : Int){
        products[index].quantity = products[index].quantity - 1
    }
    
    private func removeProduct(at index : Int){
        products.remove(at: index)
    }
}

