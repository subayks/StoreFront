//
//  OrderInfoTableViewCell.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 13/01/24.
//

import UIKit

class OrderInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var overView: UIView!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var quantity: UILabel!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productIMage: UIImageView!
    var orderInfoTableViewCellVM: OrderInfoTableViewCellVM? {
        didSet {
            self.setupView()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setupView() {
        self.productIMage.image = UIImage(named: "\(self.orderInfoTableViewCellVM?.dressInfo?.image ?? "")")
        self.quantity.text = self.orderInfoTableViewCellVM?.dressInfo?.quantity
        self.productName.text =  self.orderInfoTableViewCellVM?.dressInfo?.productName
    }
}
