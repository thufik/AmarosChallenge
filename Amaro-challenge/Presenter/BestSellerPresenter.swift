//
//  BestSellerPresenter.swift
//  Amaro-challenge
//
//  Created by EquipeSuporteAplicacao on 5/2/19.
//  Copyright © 2019 Thufik. All rights reserved.
//

import INSPhotoGallery
import UIKit

class BestSellerPresenter: BestSellerPresenterProtocol {
    
    var bestSellerView : BestSellerViewProtocol
    var bestSellerModel : BestSellerModelProtocol
    var cartSingleton : CartProtocol
    
    var products : products?
    
    init(bestSellerView : BestSellerViewProtocol, bestSellerModel : BestSellerModelProtocol, cartSingleton : CartProtocol) {
        self.bestSellerView = bestSellerView
        self.bestSellerModel = bestSellerModel
        self.cartSingleton = cartSingleton
    }
    
    func loadProducts() {
        
        let url = URLEnum.baseURL.url()
        
        bestSellerView.showLoading()
        
        bestSellerModel.loadProducts(url: url, successBlock: { products in
            self.products = products
            self.bestSellerView.hideLoading()
            self.bestSellerView.setDelegateAndDataSource()
            self.bestSellerView.registerNib()
        }) {
            self.bestSellerView.hideLoading()
            self.bestSellerView.showError()
            self.bestSellerView.reloadData()
        }
    }
    
    func configureNotificationBadge(){
        let productsCount = cartSingleton.products.count
        
        if (productsCount > 0){
            bestSellerView.setNotificationButton(with: "\(productsCount)")
        }else{
            bestSellerView.setNotificationButton(with: nil)
        }
    }
    
    func showImage(image: UIImage?) {
        if let photoImage = image{
            let photo = INSPhoto(image: photoImage, thumbnailImage: nil)
            let photoView = INSPhotosViewController(photos: [photo])
            
            bestSellerView.showImage(photoView: photoView)
        }else{
            let emptyImage = ImageEnum.unavailable.image()
            let photo = INSPhoto(image: emptyImage, thumbnailImage: nil)
            let photoView = INSPhotosViewController(photos: [photo])
            
            bestSellerView.showImage(photoView: photoView)
        }
    }
    
    func loadCell(at index : Int, cell bestSellerCollectionCell : BestSellerCollectionViewCellProtocol){
        if let products = self.products{
            let product = products.products[index]
            
            if let url = URL(string: product.image){
                bestSellerCollectionCell.setImageView(with: url)
            }else{
                bestSellerCollectionCell.setImageView(with: ImageEnum.unavailable.image())
            }
            
            bestSellerCollectionCell.setNameLabel(text: product.name)
            bestSellerCollectionCell.setCurrentPriceLabel(text: product.actual_price)
            bestSellerCollectionCell.setInstallmentsLabel(text: product.installments)
        }
    }
    
    func showView(at index : Int){
        if let products = self.products{
            let product = products.products[index]
            
            bestSellerView.showDetailView(product: product)
        }
    }
    
    func getProductsCount() -> Int{
        if let products = self.products{
            return products.products.count
        }else{
            return 0
        }
    }
}
