//
//  AddressFilledTableViewCell.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 10/01/24.
//

import UIKit

class AddressFilledTableViewCell: UITableViewCell {

    @IBOutlet weak var mobileNumber: UILabel!
    @IBOutlet weak var address2Label: UILabel!
    @IBOutlet weak var address1Label: UILabel!
    @IBOutlet weak var overView: UIView!
    var addressFilledTableViewCellVM: AddressFilledTableViewCellVM? {
        didSet {
            self.setupView()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.overView.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupView() {
        self.mobileNumber.text = self.addressFilledTableViewCellVM?.addressInfo?.mob
        self.address2Label.text = self.addressFilledTableViewCellVM?.addressInfo?.state
        self.address1Label.text = "\(self.addressFilledTableViewCellVM?.addressInfo?.city ?? ""), \(self.addressFilledTableViewCellVM?.addressInfo?.city ?? "") \(self.addressFilledTableViewCellVM?.addressInfo?.zipCode ?? "")"
    }

}
