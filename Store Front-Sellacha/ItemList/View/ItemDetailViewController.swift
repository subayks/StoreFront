//
//  ItemDetailViewController.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 26/01/24.
//

import UIKit

class ItemDetailViewController: UIViewController {

    @IBOutlet weak var buttonAddToCart: UIButton!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var countOverView: UIView!
    @IBOutlet weak var imagePlus: UIImageView!
    @IBOutlet weak var imageDelete: UIImageView!
    @IBOutlet weak var itemDetailsTableView: UITableView!
    var count = 0
    var vm = ItemDetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController?.navigationBar.isHidden = false
        self.setupNavigationBar()
        self.buttonAddToCart.layer.cornerRadius = 15
        
        self.countOverView.backgroundColor = CommonConfig.colors.themeColor
        self.countOverView.layer.cornerRadius = 10
        self.countLabel.text = "\(count)"
        
        let addTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        imagePlus.isUserInteractionEnabled = true
        imagePlus.addGestureRecognizer(addTapGestureRecognizer)
        
        let deleteTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(deleteImageTapped(tapGestureRecognizer:)))
        imageDelete.isUserInteractionEnabled = true
        imageDelete.addGestureRecognizer(deleteTapGestureRecognizer)

        let button1 = UIBarButtonItem(image: UIImage(named: "Heart"), style: .plain, target: self, action: #selector(addFav(tapGestureRecognizer:)))
        self.navigationItem.rightBarButtonItem  = button1
    }
    
    func setupNavigationBar() {
        self.navigationItem.title = "Jacket"
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
    
    @IBAction func actionAddToCart(_ sender: Any) {
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        count = count + 1
        self.countLabel.text = "\(count)"
    }
    
    @objc func deleteImageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        count = count - 1
        self.countLabel.text = "\(count)"
    }
    
    @objc func addFav(tapGestureRecognizer: UITapGestureRecognizer) {
    }
}

extension ItemDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = itemDetailsTableView.dequeueReusableCell(withIdentifier: "ItemImageTableViewCell") as! ItemImageTableViewCell
            return cell
        } else if indexPath.section == 1 {
            let cell = itemDetailsTableView.dequeueReusableCell(withIdentifier: "ColorTableViewCell") as! ColorTableViewCell
            return cell
        } else if indexPath.section == 2 {
            let cell = itemDetailsTableView.dequeueReusableCell(withIdentifier: "SizeTableViewCell") as! SizeTableViewCell
            return cell
        } else if indexPath.section == 3 {
            let cell = itemDetailsTableView.dequeueReusableCell(withIdentifier: "DescriptionTableViewCell") as! DescriptionTableViewCell
            return cell
        } else if indexPath.section == 4 {
            let cell = itemDetailsTableView.dequeueReusableCell(withIdentifier: "ReviewTableViewCell") as! ReviewTableViewCell
            return cell
        } else {
            let cell = itemDetailsTableView.dequeueReusableCell(withIdentifier: "CategoryTableViewCell") as! CategoryTableViewCell
            cell.categoryTableViewCellVM = self.vm.getMensCollectionList()
     //       cell.reloadCollectionView = true
            cell.vieewAllLabel.tag = indexPath.section
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
            cell.vieewAllLabel.isUserInteractionEnabled = true
            cell.vieewAllLabel.addGestureRecognizer(tapGestureRecognizer)
            cell.didSelectDelegate = { [weak self]  in
                guard let self = self else {return}
                let itemDetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "ItemDetailViewController") as! ItemDetailViewController
                self.navigationController?.pushViewController(itemDetailViewController, animated: true)
            }
            return cell
        }
    }
    
    
}
