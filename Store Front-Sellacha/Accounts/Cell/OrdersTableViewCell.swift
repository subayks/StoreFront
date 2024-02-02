//
//  OrdersTableViewCell.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 13/01/24.
//

import UIKit

class OrdersTableViewCell: UITableViewCell {

    @IBOutlet weak var ordersCollectionView: UICollectionView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var statusButton: UIButton!
    @IBOutlet weak var itemPrice: UILabel!
    @IBOutlet weak var itemCountLabel: UILabel!
    @IBOutlet weak var overView: UIView!
    
    var vm : OrdersTableViewCellVM? {
        didSet {
            self.setupValues()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.overView.layer.cornerRadius = 10
        self.statusButton.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupValues() {
        self.itemCountLabel.text = "No" + "Items"
        self.itemPrice.text = String(self.vm?.ordersInfo?.total ?? 0)
        self.statusButton.setTitle(self.vm?.ordersInfo?.status?.lowercased() == "pending" ? "In Process": self.vm?.ordersInfo?.status?.lowercased() == "completed" ? "Delivered": "Cancelled", for: .normal)
        self.dateLabel.text = self.vm?.ordersInfo?.sDate ?? ""
        

        if self.vm?.ordersInfo?.status?.lowercased() == "pending" {
            self.statusButton.tintColor = CommonConfig.colors.themeColor
            self.statusButton.backgroundColor = CommonConfig.colors.themeLightColor
        } else if self.vm?.ordersInfo?.status?.lowercased() == "completed" {
            self.statusButton.tintColor = UIColor.black
            self.statusButton.backgroundColor = UIColor(red: 248/255, green: 248/255, blue: 248/255, alpha: 1)
        } else {
            self.statusButton.tintColor = UIColor.red
            self.statusButton.backgroundColor = UIColor(red: 253/255, green: 233/255, blue: 233/255, alpha: 1)
        }
    }

}

extension OrdersTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OrdersCollectionViewCell", for: indexPath) as! OrdersCollectionViewCell
        cell.ordersCollectionViewCellVM = self.vm?.getOrdersCollectionViewCellVM(index: indexPath.row)
        return cell
    }
}
