//
//  CategoriesViewController.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 05/01/24.
//

import UIKit

class CategoriesViewController: UIViewController {
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var searchButton: UIImageView!

    var vm = CategoriesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.logoImage.image = CommonConfig.colors.appSmallLogo
        
        let addTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(searchTapped(tapGestureRecognizer:)))
        searchButton.isUserInteractionEnabled = true
        searchButton.addGestureRecognizer(addTapGestureRecognizer)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true

        self.vm.errorClosure = { [weak self] (error) in
            DispatchQueue.main.async {
                guard let self = self else {return}
                if error != "" {
                    let alert = UIAlertController(title: "Alert", message: error, preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
        
        self.vm.alertClosure = { [weak self] (error) in
            DispatchQueue.main.async {
                guard let self = self else {return}
                let alert = UIAlertController(title: "Alert", message: error, preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
        
        self.vm.showLoadingIndicatorClosure = { [weak self] in
            DispatchQueue.main.async {
                guard let self = self else {return}
                self.showSpinner(onView: self.view)
            }
        }
        
        self.vm.hideLoadingIndicatorClosure = { [weak self] in
            DispatchQueue.main.async {
                guard let self = self else {return}
                self.removeSpinner()
            }
        }
        
        self.vm.reloadCollectionView = { [weak self] in
            DispatchQueue.main.async {
                guard let self = self else {return}

            }
        }
        
        self.vm.navigationClosure = { [weak self] in
            DispatchQueue.main.async {
                guard let self = self else {return}
                
            }
        }
    }

    @IBAction func actionWinter(_ sender: Any) {
        let itemListViewController = self.storyboard?.instantiateViewController(withIdentifier: "ItemListViewController") as! ItemListViewController
        itemListViewController.vm = self.vm.getItemListViewModel(title: "Winter")
        self.navigationController?.pushViewController(itemListViewController, animated: true)
    }
    
    @IBAction func actionFormals(_ sender: Any) {
        let itemListViewController = self.storyboard?.instantiateViewController(withIdentifier: "ItemListViewController") as! ItemListViewController
        itemListViewController.vm = self.vm.getItemListViewModel(title: "Formals")
        self.navigationController?.pushViewController(itemListViewController, animated: true)
    }
    
    @IBAction func actionSports(_ sender: Any) {
        let itemListViewController = self.storyboard?.instantiateViewController(withIdentifier: "ItemListViewController") as! ItemListViewController
        itemListViewController.vm = self.vm.getItemListViewModel(title: "Sports")
        self.navigationController?.pushViewController(itemListViewController, animated: true)
    }
    @IBAction func actionBride(_ sender: Any) {
        let itemListViewController = self.storyboard?.instantiateViewController(withIdentifier: "ItemListViewController") as! ItemListViewController
        itemListViewController.vm = self.vm.getItemListViewModel(title: "Bride")
        self.navigationController?.pushViewController(itemListViewController, animated: true)
    }
    @IBAction func actionMen(_ sender: Any) {
        let itemListViewController = self.storyboard?.instantiateViewController(withIdentifier: "ItemListViewController") as! ItemListViewController
        itemListViewController.vm = self.vm.getItemListViewModel(title: "Men")
        self.navigationController?.pushViewController(itemListViewController, animated: true)
    }
    @IBAction func actionKids(_ sender: Any) {
        let itemListViewController = self.storyboard?.instantiateViewController(withIdentifier: "ItemListViewController") as! ItemListViewController
        itemListViewController.vm = self.vm.getItemListViewModel(title: "Kids")
        self.navigationController?.pushViewController(itemListViewController, animated: true)
    }
    
    @IBAction func actionWomen(_ sender: Any) {
        let itemListViewController = self.storyboard?.instantiateViewController(withIdentifier: "ItemListViewController") as! ItemListViewController
        itemListViewController.vm = self.vm.getItemListViewModel(title: "Women")
        self.navigationController?.pushViewController(itemListViewController, animated: true)
    }
    
    @objc func searchTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        let itemSearchViewController = self.storyboard?.instantiateViewController(withIdentifier: "ItemSearchViewController") as! ItemSearchViewController
        self.navigationController?.pushViewController(itemSearchViewController, animated: true)
    }
}

