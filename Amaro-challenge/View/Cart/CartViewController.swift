//
//  CartViewController.swift
//  Amaro-challenge
//
//  Created by EquipeSuporteAplicacao on 5/4/19.
//  Copyright © 2019 Thufik. All rights reserved.
//

import AlamofireImage
import BottomPopup
import SwiftEntryKit
import UIKit

class CartViewController: UIViewController {

    @IBOutlet weak var carttTableView: UITableView!
    
    lazy var cart = Cart.shared
    
    lazy var cartPresenter = CartViewPresenter(cartView: self, cartSingleton: cart)
    
    lazy var cartDelegateAndDataSource = CartTableViewDelegateAndDataSource(with: cartPresenter)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }
    
    private func configView(){
        carttTableView.emptyDataSetSource = self
        carttTableView.emptyDataSetSource = self
        carttTableView.delegate = cartDelegateAndDataSource
        carttTableView.dataSource = cartDelegateAndDataSource
        carttTableView.register(UINib(nibName: StringEnum.cartTableViewCell.StringFormatted(), bundle: Bundle.main), forCellReuseIdentifier: StringEnum.cartCell.StringFormatted())
    }
}

extension CartViewController : CartViewProtocol{
    func reloadTableview() {
        carttTableView.reloadData()
    }
    
    func showAlertMessage(message contentView: EKAlertMessageView, attributes: EKAttributes) {
        SwiftEntryKit.display(entry: contentView, using: attributes)
    }
    
    func dismissAlert(){
        SwiftEntryKit.dismiss()
    }
}

extension CartViewController : DZNEmptyDataSetSource, DZNEmptyDataSetDelegate{
    func title(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        let title = StringEnum.emptyCart.StringFormatted()
        
        return NSAttributedString(string: title)
    }
    
    func image(forEmptyDataSet scrollView: UIScrollView!) -> UIImage! {
        return ImageEnum.emptyCart.image()
    }
}
