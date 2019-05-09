//
//  BestSellerViewProtocol.swift
//  Amaro-challenge
//
//  Created by EquipeSuporteAplicacao on 5/2/19.
//  Copyright © 2019 Thufik. All rights reserved.
//

import INSPhotoGallery
import UIKit

protocol BestSellerViewProtocol {
    func setDelegateAndDataSource()
    func registerNib()
    func showLoading()
    func hideLoading()
    func showError()
    func showDetailView(product : product)
    func showImage(photoView : INSPhotosViewController)
    func setNotificationButton(with badge : String?)
    func reloadData()
}
