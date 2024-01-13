//
//  OrdersCollectionViewCell.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 13/01/24.
//

import UIKit

class OrdersCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var itemImage: UIImageView!
    var ordersCollectionViewCellVM: OrdersCollectionViewCellVM? {
        didSet {
            self.setupValues()
        }
    }
    
    func setupValues() {
        self.itemImage.image = UIImage(named: self.ordersCollectionViewCellVM?.dressCellObject?.image ?? "")
    }
}
