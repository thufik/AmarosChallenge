//
//  BestSellerDelegateAndDatasource.swift
//  Amaro-challenge
//
//  Created by EquipeSuporteAplicacao on 5/2/19.
//  Copyright © 2019 Thufik. All rights reserved.
//

import INSPhotoGallery
import UIKit

class BestSellerDelegateAndDatasource: NSObject, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    fileprivate let sectionInsets = UIEdgeInsets(top: 20.0, left: 20.0, bottom: 5.0, right: 20.0)
    
    var bestSellerPresenter : BestSellerPresenterProtocol
    
    var bestSellerView : BestSellerViewProtocol
    
    init(bestSellerPresenter : BestSellerPresenterProtocol, bestSellerView : BestSellerViewProtocol) {
        self.bestSellerPresenter = bestSellerPresenter
        self.bestSellerView = bestSellerView
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bestSellerPresenter.getProductsCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bestSellerCell", for: indexPath) as! BestSellerCollectionViewCell
        
        cell.load(index: indexPath.row, bestSellerPresenter: bestSellerPresenter)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let margins = self.sectionInsets.right + self.sectionInsets.left
        
        let spaceAvailable = UIScreen.main.bounds.width - margins
        
        let spaceFree = spaceAvailable - 5
        
        let widthPerItem = spaceFree / 2

        return CGSize(width: widthPerItem, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20.0
    }
}
