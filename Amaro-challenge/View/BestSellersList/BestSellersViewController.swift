//
//  ViewController.swift
//  Amaro-challenge
//
//  Created by EquipeSuporteAplicacao on 5/2/19.
//  Copyright © 2019 Thufik. All rights reserved.
//

import AlamofireImage
import Hero
import INSPhotoGallery
import UIKit

class BestSellersViewController: UIViewController {

    lazy var bestSellerModel : BestSellerModelProtocol = BestSellerModel()
    
    lazy var cart = Cart.shared
    
    lazy var bestSellerPresenter : BestSellerPresenterProtocol = BestSellerPresenter(bestSellerView: self, bestSellerModel: bestSellerModel, cartSingleton: cart)
    
    lazy var bestSellerDelegateAndDataSource : BestSellerDelegateAndDatasource = BestSellerDelegateAndDatasource(bestSellerPresenter: bestSellerPresenter, bestSellerView: self)

    @IBOutlet weak var bestSellerCollectionView: UICollectionView!
    
    @IBOutlet weak var bestSellerCollectionviewFlowLayout: UICollectionViewFlowLayout!
    
    @IBOutlet weak var barButtonCart: UIBarButtonItem!
    
    let notificationButton = SSBadgeButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configView()
        bestSellerPresenter.loadProducts()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        bestSellerPresenter.configureNotificationBadge()
    }
    
    private func configView(){
        bestSellerCollectionView.emptyDataSetSource = self
        bestSellerCollectionView.emptyDataSetDelegate = self
        
        bestSellerCollectionviewFlowLayout.minimumInteritemSpacing = 5.0
        
        notificationButton.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        notificationButton.setImage(ImageEnum.cart.image().withRenderingMode(.alwaysTemplate), for: .normal)
        notificationButton.badgeEdgeInsets = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 15)
        notificationButton.addTarget(self, action: #selector(rightButtonTouched), for: .touchUpInside)
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: notificationButton)
    }
    
    @objc func rightButtonTouched(){
        let cartView = UIStoryboard(name: StringEnum.storyBoardMain.StringFormatted(), bundle: Bundle.main).instantiateViewController(withIdentifier: StringEnum.cartNavigationViewController.StringFormatted())
        
        self.present(cartView, animated: true, completion: nil)
    }
}

extension BestSellersViewController : BestSellerViewProtocol{
    func showImage(photoView: INSPhotosViewController) {
        self.present(photoView, animated: true, completion: nil)
    }
    
    func setDelegateAndDataSource() {
        bestSellerCollectionView.delegate = bestSellerDelegateAndDataSource
        bestSellerCollectionView.dataSource = bestSellerDelegateAndDataSource
    }
    
    func registerNib() {
        bestSellerCollectionView.register(UINib(nibName: StringEnum.bestSellerCollectionViewCell.StringFormatted(), bundle: Bundle.main), forCellWithReuseIdentifier: StringEnum.bestSellerCell.StringFormatted())
    }
    
    func showDetailView(product : product) {
        let detailNavigationController = UIStoryboard(name: StringEnum.storyBoardMain.StringFormatted(), bundle: Bundle.main).instantiateViewController(withIdentifier: StringEnum.detailViewController.StringFormatted())
        
        guard let detailViewController = detailNavigationController.children.first as? DetailViewController else{
            return
        }
        
        detailViewController.product = product
        detailNavigationController.hero.isEnabled = true
        detailNavigationController.hero.modalAnimationType = .selectBy(presenting: .zoom, dismissing: .zoomOut)
        
        self.present(detailNavigationController, animated: true, completion: nil)
    }
    
    func setNotificationButton(with badge : String?){
        notificationButton.badge = badge
    }
    
    func showLoading() {
        
    }
    
    func hideLoading() {
        
    }
    
    func showError() {
        
    }
    
    func reloadData(){
        bestSellerCollectionView.reloadData()
    }
}

extension BestSellersViewController : DZNEmptyDataSetSource, DZNEmptyDataSetDelegate{
    func image(forEmptyDataSet scrollView: UIScrollView!) -> UIImage! {
        return ImageEnum.errorLoad.image()
    }
    
    func title(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        let title = StringEnum.errorLoadMessage.StringFormatted()
        
        return NSAttributedString(string: title)
    }
}
