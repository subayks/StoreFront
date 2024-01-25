//
//  CategoriesViewController.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 05/01/24.
//

import UIKit

class CategoriesViewController: UIViewController {
    @IBOutlet weak var logoImage: UIImageView!

    var vm = CategoriesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.logoImage.image = CommonConfig.colors.appSmallLogo
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
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
}

