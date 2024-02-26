//
//  CheckoutViewController.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 09/01/24.
//

import UIKit

class CheckoutViewController: UIViewController {

    @IBOutlet weak var orderButton: UIButton!
    @IBOutlet weak var checkoutTableView: UITableView!
    var vm: CheckoutViewControllerVM?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false

        self.setupNavigationBar()
        self.orderButton.backgroundColor = CommonConfig.colors.themeColor
        self.orderButton.layer.cornerRadius = 10
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
        
        self.vm?.navigationClosure = { [weak self] in
            DispatchQueue.main.async {
                guard let self = self else {return}
                let completionViewController = self.storyboard?.instantiateViewController(withIdentifier: "CompletionViewController") as! CompletionViewController
                self.navigationController?.pushViewController(completionViewController, animated: true)
            }
        }
        
        self.vm?.reloadTableView = { [weak self] in
            DispatchQueue.main.async {
                guard let self = self else {return}
                self.checkoutTableView.reloadData()
            }
        }
    }
    
    func setupNavigationBar() {
        self.navigationItem.title = "Checkout"
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

    @IBAction func actionPromoCode(_ sender: Any) {
        
    }
    
    @IBAction func actionorder(_ sender: Any) {
        if self.vm?.addressInfo != nil && self.vm?.cardInfo != nil {
            self.vm?.makeCart()
        } else {
           if self.vm?.addressInfo == nil {
               let alert = UIAlertController(title: "Alert", message: "Please Fill Address", preferredStyle: UIAlertController.Style.alert)
               alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
               self.present(alert, animated: true, completion: nil)
            } else {
                let alert = UIAlertController(title: "Alert", message: "Please Fill Card Info", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
}

extension CheckoutViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            if self.vm?.addressInfo == nil {
                let cell = checkoutTableView.dequeueReusableCell(withIdentifier: "CardTableViewCell") as! CardTableViewCell
                cell.cardTableViewCellVM = self.vm?.getAddressCardTableViewCellVM()
                return cell
            } else {
                let cell = checkoutTableView.dequeueReusableCell(withIdentifier: "AddressFilledTableViewCell") as! AddressFilledTableViewCell
                cell.addressFilledTableViewCellVM = self.vm?.getAddressFilledTableViewCellVM()
                return cell
            }
        } else if indexPath.section == 1 {
            if self.vm?.cardInfo == nil {
                let cell = checkoutTableView.dequeueReusableCell(withIdentifier: "CardTableViewCell") as! CardTableViewCell
                cell.cardTableViewCellVM = self.vm?.getPaymentCardTableViewCellVM()
                return cell
            } else {
                let cell = checkoutTableView.dequeueReusableCell(withIdentifier: "CardFilledTableViewCell") as! CardFilledTableViewCell
                cell.cardFilledTableViewCellVm = self.vm?.getCardFilledTableViewCellVm()
                return cell
            }
        } else {
            let cell = checkoutTableView.dequeueReusableCell(withIdentifier: "BillInfoTableViewCell") as! BillInfoTableViewCell
            cell.billInfoTableViewCellVM = self.vm?.getBillInfoTableViewCellVM()
            return cell
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            let addressViewController = self.storyboard?.instantiateViewController(withIdentifier: "AddressViewController") as! AddressViewController
            addressViewController.addressClosure = { CardInfo in
                self.vm?.addressInfo = CardInfo
            }
            self.navigationController?.pushViewController(addressViewController, animated: true)
        } else if indexPath.section == 1 {
            let cardsViewController = self.storyboard?.instantiateViewController(withIdentifier: "CardsViewController") as! CardsViewController
            cardsViewController.cardClosure = { CardInfo in
                self.vm?.cardInfo = CardInfo
            }
            self.navigationController?.pushViewController(cardsViewController, animated: true)
        }
    }
    
}


