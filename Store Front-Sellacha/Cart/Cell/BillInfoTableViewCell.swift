//
//  BillInfoTableViewCell.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 09/01/24.
//

import UIKit

class BillInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var addPromoCode: UILabel!
    @IBOutlet weak var totalvalue: UILabel!
    @IBOutlet weak var totalBillLabel: UILabel!
    @IBOutlet weak var discountValue: UILabel!
    @IBOutlet weak var GStValue: UILabel!
    @IBOutlet weak var deliveryFeeValue: UILabel!
    @IBOutlet weak var subTotalValue: UILabel!
    @IBOutlet weak var gstLabel: UILabel!
    @IBOutlet weak var discountLabel: UILabel!
    @IBOutlet weak var deliveryLabel: UILabel!
    @IBOutlet weak var subtotalLabel: UILabel!
    @IBOutlet weak var ticketOverView: UIView!
    @IBOutlet weak var overView: UIView!
    
    var billInfoTableViewCellVM: BillInfoTableViewCellVM? {
        didSet {
            self.setupView()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.overView.layer.cornerRadius = 10
        self.ticketOverView.layer.cornerRadius = 10
        self.addPromoCode.textColor = CommonConfig.colors.themeColor
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupView() {
        self.subTotalValue.text = "₹" + (self.billInfoTableViewCellVM?.billInfo?.subtotal ?? "")
        self.discountValue.text = "₹" + (self.billInfoTableViewCellVM?.billInfo?.discount ?? "")
        self.deliveryFeeValue.text = "₹" + (self.billInfoTableViewCellVM?.billInfo?.deliveryFee ?? "")
        self.totalvalue.text = "₹" + (self.billInfoTableViewCellVM?.billInfo?.total ?? "")
        self.GStValue.text = "₹" + (self.billInfoTableViewCellVM?.billInfo?.gst ?? "")
    }
}
