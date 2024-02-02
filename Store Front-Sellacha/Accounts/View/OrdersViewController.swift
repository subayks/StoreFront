//
//  OrdersViewController.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 13/01/24.
//

import UIKit

class OrdersViewController: UIViewController {

    @IBOutlet weak var ordersTableView: UITableView!
    @IBOutlet weak var ordersSegmentView: UISegmentedControl!
    var vm: OrdersViewControllerVM?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.ordersSegmentView.layer.cornerRadius = 10
        
        self.ordersSegmentView.tintColor = CommonConfig.colors.themeColor
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        ordersSegmentView.setTitleTextAttributes(titleTextAttributes, for: .selected)
        
        let titleGrayTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.gray]
        ordersSegmentView.setTitleTextAttributes(titleGrayTextAttributes, for: .disabled)
        self.ordersSegmentView.selectedSegmentIndex = 0

        self.setupNavigationBar()
        ordersSegmentView.addTarget(self, action: #selector(OrdersViewController.indexChanged(_:)), for: .valueChanged)
    }
    
    @IBAction func actionSegment(_ sender: UISegmentedControl) {
        self.vm?.selectedIndex = sender.selectedSegmentIndex
        self.ordersTableView.reloadData()
    }
    
    @objc func indexChanged(_ sender: UISegmentedControl) {
        self.vm?.selectedIndex = sender.selectedSegmentIndex
        self.ordersTableView.reloadData()
    }
    
    func setupNavigationBar() {
        self.navigationController?.navigationBar.isHidden = false
        self.navigationItem.title = "Orders"
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

extension OrdersViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.vm?.selectedIndex == 0 {
            return self.vm?.getActiveList().count ?? 0
        } else {
            return self.vm?.getPastList().count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ordersTableView.dequeueReusableCell(withIdentifier: "OrdersTableViewCell") as! OrdersTableViewCell
        cell.vm = self.vm?.getOrdersTableViewCellVM(index: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let orderDetailsViewController = self.storyboard?.instantiateViewController(withIdentifier: "OrderDetailsViewController") as! OrderDetailsViewController
        orderDetailsViewController.vm = self.vm?.getOrderDetailsViewControllerVM(index: indexPath.row)
        self.navigationController?.pushViewController(orderDetailsViewController, animated: true)
    }
}
