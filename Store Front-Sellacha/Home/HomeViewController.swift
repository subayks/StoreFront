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
            cell.reloadCollectionView = true
            cell.didSelectDelegate = { [weak self] (stylist, speciality, row,salonId,  id) in
                guard let self = self else {return}
             //   self.endUserDashboardViewModel.resetTableView = true
//                let shopDetailsView = self.storyboard?.instantiateViewController(withIdentifier: "ShopDetailsView") as! ShopDetailsView
//                shopDetailsView.shopDetailsViewModel = self.endUserDashboardViewModel.getShopDetailsViewModel(section: indexPath.section, index: row)
//                self.tabBarController?.tabBar.isHidden = true
//                self.navigationController?.pushViewController(shopDetailsView, animated: true)
            }
            return cell
        }
    }
    
    
}
