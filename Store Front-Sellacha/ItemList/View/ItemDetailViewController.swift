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
    var vm: ItemDetailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
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

        if self.vm?.isFromWishList ?? false {
            let button1 = UIBarButtonItem(image: UIImage(named: "Heart 1"), style: .plain, target: self, action: #selector(addFav(tapGestureRecognizer:)))
            button1.tintColor = CommonConfig.colors.themeColor
            self.navigationItem.rightBarButtonItem  = button1
        } else {
            let button1 = UIBarButtonItem(image: UIImage(named: "Heart"), style: .plain, target: self, action: #selector(addFav(tapGestureRecognizer:)))
            self.navigationItem.rightBarButtonItem  = button1
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.vm?.errorClosure = { [weak self] (error) in
            DispatchQueue.main.async {
                guard let self = self else {return}
                if error != "" {
                    let alert = UIAlertController(title: "Alert", message: error, preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
        
        self.vm?.alertClosure = { [weak self] (error) in
            DispatchQueue.main.async {
                guard let self = self else {return}
                let alert = UIAlertController(title: "Alert", message: error, preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
        
        self.vm?.showLoadingIndicatorClosure = { [weak self] in
            DispatchQueue.main.async {
                guard let self = self else {return}
                self.showSpinner(onView: self.view)
            }
        }
        
        self.vm?.hideLoadingIndicatorClosure = { [weak self] in
            DispatchQueue.main.async {
                guard let self = self else {return}
                self.removeSpinner()
            }
        }
        
        self.vm?.reloadCollectionView = { [weak self] in
            DispatchQueue.main.async {
                guard let self = self else {return}
                self.itemDetailsTableView.reloadData()
            }
        }
        
        self.vm?.navigationClosure = { [weak self] in
            DispatchQueue.main.async {
                guard let self = self else {return}
                let itemDetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "ItemDetailViewController") as! ItemDetailViewController
                itemDetailViewController.vm = self.vm?.getItemDetailViewModel()
                self.navigationController?.pushViewController(itemDetailViewController, animated: true)
            }
        }
        
        self.vm?.reloadHeartImage = { [weak self] in
            DispatchQueue.main.async {
                guard let self = self else {return}
                self.navigationItem.rightBarButtonItem = nil
                if self.vm?.isFromWishList ?? false {
                    let button1 = UIBarButtonItem(image: UIImage(named: "Heart"), style: .plain, target: self, action: #selector(self.addFav(tapGestureRecognizer:)))
                    self.navigationItem.rightBarButtonItem  = button1
                } else {
                    let button1 = UIBarButtonItem(image: UIImage(named: "Heart 1"), style: .plain, target: self, action: #selector(self.addFav(tapGestureRecognizer:)))
                    button1.tintColor = CommonConfig.colors.themeColor
                    self.navigationItem.rightBarButtonItem  = button1
                }
            }
        }
    }
    
    func setupNavigationBar() {
        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController?.navigationBar.isHidden = false
        if self.vm?.productDetailsModel?.info?.categories?.count ?? 0 > 0 {
            self.navigationItem.title = self.vm?.productDetailsModel?.info?.title ?? ""
        } else {
            self.navigationItem.title = self.vm?.productDetailsModel?.info?.title
        }
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
        if self.vm?.isFromWishList ?? false {
            if UserDefaults.standard.bool(forKey: "isLoggedIn") {
                self.vm?.removeWishList(id: "\(self.vm?.productDetailsModel?.info?.id ?? 0)")
            }
        } else {
            if UserDefaults.standard.bool(forKey: "isLoggedIn") {
                self.vm?.addToWishList(id: "\(self.vm?.productDetailsModel?.info?.id ?? 0)")
            } else {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let viewController = storyboard.instantiateViewController(withIdentifier: "LoginOrSignUpViewController") as! LoginOrSignUpViewController
                viewController.isSignInClicked = { [weak self] (isSignInClicked) in
                    if isSignInClicked {
                        let signInViewController = storyboard.instantiateViewController(withIdentifier: "SignInViewController") as! SignInViewController
                        signInViewController.isSignInClicked = { [weak self] in
                            let checkoutViewController = storyboard.instantiateViewController(withIdentifier: "CheckoutViewController") as! CheckoutViewController
                            self?.navigationController?.pushViewController(checkoutViewController, animated: true)
                        }
                        self?.present(signInViewController, animated: true)
                    } else {
                        let signupViewController = storyboard.instantiateViewController(withIdentifier: "SignupViewController") as! SignupViewController
                        signupViewController.isSignUpClicked = { [weak self] in
                            let signInViewController = storyboard.instantiateViewController(withIdentifier: "SignInViewController") as! SignInViewController
                            signInViewController.isSignInClicked = { [weak self] in
                                self?.vm?.addToWishList(id: "\(self?.vm?.productDetailsModel?.info?.id ?? 0)")
                            }
                            self?.present(signInViewController, animated: true)
                        }
                        self?.present(signupViewController, animated: true)
                    }
                }
                if let presentationController = viewController.presentationController as? UISheetPresentationController {
                    presentationController.detents = [.medium(), .large()]
                    presentationController.preferredCornerRadius = 20
                    
                }
                self.present(viewController, animated: true)
            }
        }
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
            cell.itemImageTableViewCellVM = self.vm?.getItemImageTableViewCellVM()
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
            cell.categoryTableViewCellVM = self.vm?.getMensCollectionList()
            cell.reloadCollectionView = true
            cell.vieewAllLabel.tag = indexPath.section
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
            cell.vieewAllLabel.isUserInteractionEnabled = true
            cell.vieewAllLabel.addGestureRecognizer(tapGestureRecognizer)
            cell.didSelectDelegate = { [weak self]  id in
                guard let self = self else {return}
                self.vm?.getProductDetails(id: id)
            }
            return cell
        }
    }
    
    
}
