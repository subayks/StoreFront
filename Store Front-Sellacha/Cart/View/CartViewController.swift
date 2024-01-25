//
//  CartViewController.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 06/01/24.
//

import UIKit

class CartViewController: UIViewController {
    
    @IBOutlet weak var goToCartButton: UIButton!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var itemCount: UILabel!
    @IBOutlet weak var cartTableView: UITableView!
    @IBOutlet weak var logoImage: UIImageView!
    
    var vm = CartViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.logoImage.image = CommonConfig.colors.appSmallLogo
       
        self.goToCartButton.layer.cornerRadius = 25
        self.goToCartButton.layer.borderWidth = 2
        self.goToCartButton.layer.borderColor = UIColor.white.cgColor
        
        self.goToCartButton.backgroundColor = CommonConfig.colors.themeColor
        self.priceLabel.textColor = CommonConfig.colors.themeColor
        guard let  mainTabbarController = UIApplication.shared.keyWindow?.rootViewController as? HomeTabbarController else { return }
        mainTabbarController.tabBar.items?[3].badgeValue = "3"
        mainTabbarController.tabBar.items?[3].title = "₹2,000"
        
        mainTabbarController.tabBar.items?[3].badgeColor = CommonConfig.colors.themeColor
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
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
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

extension CartViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 2
        } else {
            return 1
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))
        let label = UILabel()
        label.frame = CGRect.init(x: 15, y: 5, width: headerView.frame.width-10, height: headerView.frame.height-10)
        if section == 0 {
            label.text = "Men"
        } else {
            label.text = "Women"
        }
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
        cell.cartTableViewCellVM = CartTableViewCellVM(currentCount: 1)
        cell.countClosure = { [weak self] (count) in
            guard let self = self else {return}
            cell.countLabel.text = String(count)
        }
        return cell
    }
    
    
}
