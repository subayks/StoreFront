//
//  CartViewController.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 06/01/24.
//

import UIKit

class CartViewController: UIViewController {
    
    @IBOutlet weak var imageBin: UIImageView!
    @IBOutlet weak var goToCartButton: UIButton!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var itemCount: UILabel!
    @IBOutlet weak var cartTableView: UITableView!
    @IBOutlet weak var logoImage: UIImageView!
    
    var viewModel = CartViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.getCart()
        self.logoImage.image = CommonConfig.colors.appSmallLogo
       
        self.goToCartButton.layer.cornerRadius = 25
        self.goToCartButton.layer.borderWidth = 2
        self.goToCartButton.layer.borderColor = UIColor.white.cgColor
        
        self.goToCartButton.backgroundColor = CommonConfig.colors.themeColor
        self.priceLabel.textColor = CommonConfig.colors.themeColor
        
        let addTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(deleteClicked(tapGestureRecognizer:)))
        imageBin.isUserInteractionEnabled = true
        imageBin.addGestureRecognizer(addTapGestureRecognizer)
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
        
        self.viewModel.reloadTableView = { [weak self] in
            DispatchQueue.main.async {
                guard let self = self else {return}
                if self.viewModel.cartModel?.items?.count != 0 {
                    guard let  mainTabbarController = UIApplication.shared.keyWindow?.rootViewController as? HomeTabbarController else { return }
                    mainTabbarController.tabBar.items?[3].badgeColor = CommonConfig.colors.themeColor
                    mainTabbarController.tabBar.items?[3].badgeValue = "\(self.viewModel.cartModel?.items?.count ?? 0)"
                    self.itemCount.text = "\(self.viewModel.cartModel?.items?.count ?? 0) Items"
                    mainTabbarController.tabBar.items?[3].title = "₹" + self.viewModel.totalBill()
                    self.priceLabel.text = "₹" + self.viewModel.totalBill()
                } else {
                    self.itemCount.text = ""
                    self.priceLabel.text = ""
                    self.goToCartButton.isHidden = true
                }
                
                self.cartTableView.reloadData()
            }
        }
        
        self.viewModel.navigationClosure = { [weak self] in
            DispatchQueue.main.async {
                guard let self = self else {return}
                
            }
        }
    }
    
    @IBAction func actiongoToCart(_ sender: Any) {
        if !UserDefaults.standard.bool(forKey: "isLoggedIn") {
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
                            let checkoutViewController = storyboard.instantiateViewController(withIdentifier: "CheckoutViewController") as! CheckoutViewController
                            self?.navigationController?.pushViewController(checkoutViewController, animated: true)
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
        } else {
            let checkoutViewController = self.storyboard?.instantiateViewController(withIdentifier: "CheckoutViewController") as! CheckoutViewController
            self.navigationController?.pushViewController(checkoutViewController, animated: true)}
    }
    
    @objc func deleteClicked(tapGestureRecognizer: UITapGestureRecognizer) {
        print("deleye")
    }
}

extension CartViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.cartModel?.items?.count ?? 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.viewModel.cartModel?.items?.count == 0 ? 0:1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))
        let label = UILabel()
        label.frame = CGRect.init(x: 15, y: 5, width: headerView.frame.width-10, height: headerView.frame.height-10)
        
        label.text = "Men"
        
        label.font = UIFont(name: "Roboto-Medium", size: 14)
        label.textColor = .black
        headerView.addSubview(label)
        headerView.backgroundColor = UIColor.systemGray5
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = cartTableView.dequeueReusableCell(withIdentifier: "CartTableViewCell") as! CartTableViewCell
        cell.overView.layer.cornerRadius = 10
        cell.countBackGround.layer.cornerRadius = 10
        cell.cartTableViewCellVM = self.viewModel.getCartTableViewCellVM(index: indexPath.row)
        cell.countClosure = { [weak self] (count) in
            guard let self = self else {return}
            cell.countLabel.text = String(count)
        }
        return cell
    }
    
    
}
