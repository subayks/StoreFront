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
    
    var viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.logoImage.image = CommonConfig.colors.appSmallLogo
        
        let addTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(searchTapped(tapGestureRecognizer:)))
        searchButton.isUserInteractionEnabled = true
        searchButton.addGestureRecognizer(addTapGestureRecognizer)
        self.viewModel.getSliderInfo()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true

        self.viewModel.errorClosure = { [weak self] (error) in
            DispatchQueue.main.async {
                guard let self = self else {return}
                if error != "" {
                    let alert = UIAlertController(title: "Alert", message: error, preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
        
        self.viewModel.alertClosure = { [weak self] (error) in
            DispatchQueue.main.async {
                guard let self = self else {return}
                let alert = UIAlertController(title: "Alert", message: error, preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
        
        self.viewModel.showLoadingIndicatorClosure = { [weak self] in
            DispatchQueue.main.async {
                guard let self = self else {return}
                self.showSpinner(onView: self.view)
            }
        }
        
        self.viewModel.hideLoadingIndicatorClosure = { [weak self] in
            DispatchQueue.main.async {
                guard let self = self else {return}
                self.removeSpinner()
            }
        }
        
        self.viewModel.reloadSliderCollectionView = { [weak self] in
            DispatchQueue.main.async {
                guard let self = self else {return}
                self.HomeTableView.reloadRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
            }
        }
        
        self.viewModel.navigationClosure = { [weak self] in
            DispatchQueue.main.async {
                guard let self = self else {return}
               
            }
        }
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer){
     //   print(tapGestureRecognizer.view?.tag)
        let itemListViewController = self.storyboard?.instantiateViewController(withIdentifier: "ItemListViewController") as! ItemListViewController
        itemListViewController.vm = self.viewModel.getItemListViewModel()
        self.navigationController?.pushViewController(itemListViewController, animated: true)
    }
    
    @objc func searchTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        let itemSearchViewController = self.storyboard?.instantiateViewController(withIdentifier: "ItemSearchViewController") as! ItemSearchViewController
        self.navigationController?.pushViewController(itemSearchViewController, animated: true)
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
            cell.welcomeTableViewCellVM = self.viewModel.getWelcomeTableViewCellVM()
            cell.setupView()
            return cell
        } else {
            let cell = HomeTableView.dequeueReusableCell(withIdentifier: "CategoryTableViewCell") as! CategoryTableViewCell
            cell.categoryTableViewCellVM = self.viewModel.getMensCollectionList()
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
