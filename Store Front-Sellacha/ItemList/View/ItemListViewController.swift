//
//  ItemListViewController.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 26/01/24.
//

import UIKit

class ItemListViewController: UIViewController {

    @IBOutlet weak var overVieFilter: UIView!
    @IBOutlet weak var overViewSort: UIView!
    @IBOutlet weak var overViewBrand: UIView!
    @IBOutlet weak var buttonCart: UIButton!
    @IBOutlet weak var itemListCollectionView: UICollectionView!
    var vm: ItemListViewModel?
    var isCartClicked:(()->())?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false

        self.buttonCart.layer.cornerRadius = 10
        self.overVieFilter.layer.cornerRadius = 10
        self.overViewSort.layer.cornerRadius = 10
        self.overViewBrand.layer.cornerRadius = 10

        self.setupNavigationBar()
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        itemListCollectionView.collectionViewLayout = layout
        
        let button1 = UIBarButtonItem(image: UIImage(named: "Search"), style: .plain, target: self, action: #selector(searchClicked(tapGestureRecognizer:)))
        self.navigationItem.rightBarButtonItem  = button1
    }
    
    func setupNavigationBar() {
        self.navigationItem.title = self.vm?.title ?? ""
        self.navigationController?.isNavigationBarHidden = false
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.white
        appearance.titleTextAttributes = [.font: UIFont(name: "Roboto-Medium", size: 16)!,
                                          .foregroundColor: UIColor.black]
        
        // Customizing our navigation bar
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }

    @IBAction func actionFilter(_ sender: Any) {
    }
    
    @IBAction func actionSort(_ sender: Any) {
    }
    
    @IBAction func actionBrand(_ sender: Any) {
    }
    
    @IBAction func actionCart(_ sender: Any) {
        self.tabBarController?.tabBar.isHidden = false
        self.hidesBottomBarWhenPushed = false
        self.tabBarController?.selectedIndex = 3
    }
    
    @objc func searchClicked(tapGestureRecognizer: UITapGestureRecognizer) {
        let itemDetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "ItemSearchViewController") as! ItemSearchViewController
        self.navigationController?.pushViewController(itemDetailViewController, animated: true)
    }
}

extension ItemListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.vm?.getnumberOfRows() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as! CategoryCollectionViewCell
        cell.categoryCollectionViewCellVM = self.vm?.getCategoryCollectionViewCell(index: indexPath.row)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let itemDetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "ItemDetailViewController") as! ItemDetailViewController
        self.navigationController?.pushViewController(itemDetailViewController, animated: true)
    }
    
}

extension ItemListViewController : UICollectionViewDelegateFlowLayout{

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = collectionView.bounds.width
        return CGSize(width: collectionViewWidth/2.07, height: 220)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}
