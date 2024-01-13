//
//  OrderDetailsViewController.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 13/01/24.
//

import UIKit

class OrderDetailsViewController: UIViewController {

    @IBOutlet weak var orderIDValueLAbel: UILabel!
    @IBOutlet weak var orderDescLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var orderReceivedButton: UIButton!
    @IBOutlet weak var helpButton: UIButton!
    @IBOutlet weak var orderDetailsTableView: UITableView!
    var vm: OrderDetailsViewControllerVM?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false

        self.orderIDValueLAbel.textColor = CommonConfig.colors.themeColor
        self.helpButton.layer.cornerRadius = 10
        self.orderReceivedButton.layer.cornerRadius = 10
        self.helpButton.layer.borderWidth = 1
        self.helpButton.layer.borderColor = CommonConfig.colors.themeColor.cgColor
        self.orderReceivedButton.backgroundColor = CommonConfig.colors.themeColor
        
        self.setupNavigationBar()
        self.statusLabel.text = self.vm?.ordersInfo?.status.rawValue
        
        if self.vm?.ordersInfo?.status == .InProcess {
            self.statusLabel.textColor = CommonConfig.colors.themeColor
        } else if self.vm?.ordersInfo?.status == .Delivered {
            self.statusLabel.textColor = UIColor.black
            self.orderDescLabel.text = ""
            self.helpButton.isHidden = true
            self.orderReceivedButton.isHidden = true
        } else {
            self.statusLabel.textColor = UIColor.red
            self.orderDescLabel.text = ""
            self.helpButton.isHidden = true
            self.orderReceivedButton.isHidden = true
        }

        
    }
    
    @IBAction func actionHelp(_ sender: Any) {
    }
    
    @IBAction func actionOrderReceived(_ sender: Any) {
    }
    
    func setupNavigationBar() {
        self.navigationItem.title = "Orders Details"
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
}

extension OrderDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return self.vm?.ordersInfo?.dresses.count ?? 0
        } else {
            return 1
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = orderDetailsTableView.dequeueReusableCell(withIdentifier: "OrderInfoTableViewCell") as! OrderInfoTableViewCell
            cell.orderInfoTableViewCellVM = self.vm?.getOrderInfoTableViewCellVM(index: indexPath.row)
            return cell
        } else if indexPath.section == 1 {
            let cell = orderDetailsTableView.dequeueReusableCell(withIdentifier: "BillInfoTableViewCell") as! BillInfoTableViewCell
            cell.billInfoTableViewCellVM = self.vm?.getBillInfoTableViewCellVM()
            return cell
        } else if indexPath.section == 2 {
            let cell = orderDetailsTableView.dequeueReusableCell(withIdentifier: "AddressFilledTableViewCell") as! AddressFilledTableViewCell
            cell.addressFilledTableViewCellVM = self.vm?.getAddressFilledTableViewCellVM()
            return cell
        } else  {
            let cell = orderDetailsTableView.dequeueReusableCell(withIdentifier: "CardFilledTableViewCell") as! CardFilledTableViewCell
            cell.cardFilledTableViewCellVm = self.vm?.getCardFilledTableViewCellVm()
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
         return CGFloat.leastNonzeroMagnitude
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
         return CGFloat.leastNonzeroMagnitude
    }
}
