//
//  CardViewTableViewCell.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 15/01/24.
//

import UIKit

class CardViewTableViewCell: UITableViewCell {

    @IBOutlet weak var expDateNum: UILabel!
    @IBOutlet weak var cardNumber: UILabel!
    @IBOutlet weak var cardHolderName: UILabel!
    @IBOutlet weak var imageDelete: UIImageView!
    @IBOutlet weak var cardTypeImage: UIImageView!
    @IBOutlet weak var overViewImage: UIImageView!
    @IBOutlet weak var overView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.cardHolderName.textColor = CommonConfig.colors.themeColor
        self.overView.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
