//
//  CardFilledTableViewCell.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 10/01/24.
//

import UIKit

class CardFilledTableViewCell: UITableViewCell {

    @IBOutlet weak var overView: UIView!
    @IBOutlet weak var cardType: UIImageView!
    @IBOutlet weak var cardNo: UILabel!
    var cardFilledTableViewCellVm: CardFilledTableViewCellVm? {
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
        self.cardNo.text = self.cardFilledTableViewCellVm?.cardInfo?.title
        self.cardType.image = self.cardFilledTableViewCellVm?.cardInfo?.image
    }

}
