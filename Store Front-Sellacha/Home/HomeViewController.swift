//
//  HomeViewController.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 05/01/24.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var itemSeachBar: UISearchBar!
    @IBOutlet weak var searchButton: UIImageView!
    @IBOutlet weak var HomeTableView: UITableView!
    
    var vm = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.logoImage.image = CommonConfig.colors.appSmallLogo
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer){
     //   print(tapGestureRecognizer.view?.tag)
        let itemListViewController = self.storyboard?.instantiateViewController(withIdentifier: "ItemListViewController") as! ItemListViewController
        itemListViewController.vm = self.vm.getItemListViewModel()
        self.navigationController?.pushViewController(itemListViewController, animated: true)
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = HomeTableView.dequeueReusableCell(withIdentifier: "WelcomeTableViewCell") as! WelcomeTableViewCell
            cell.welcomeTableViewCellVM = self.vm.getWelcomeTableViewCellVM()
            cell.setupView()
            return cell
        } else {
            let cell = HomeTableView.dequeueReusableCell(withIdentifier: "CategoryTableViewCell") as! CategoryTableViewCell
            cell.categoryTableViewCellVM = self.vm.getMensCollectionList()
           // cell.reloadCollectionView = true
            cell.vieewAllLabel.tag = indexPath.section
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
            cell.vieewAllLabel.isUserInteractionEnabled = true
            cell.vieewAllLabel.addGestureRecognizer(tapGestureRecognizer)
            cell.didSelectDelegate = { [weak self] in
                guard let self = self else {return}
                let itemDetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "ItemDetailViewController") as! ItemDetailViewController
                self.navigationController?.pushViewController(itemDetailViewController, animated: true)
            }
            return cell
        }
    }
    
    
}
