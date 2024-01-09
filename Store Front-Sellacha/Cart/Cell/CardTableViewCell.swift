//
//  CardTableViewCell.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 09/01/24.
//

import UIKit

class CardTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var overView: UIView!
    var cardTableViewCellVM: CardTableViewCellVM? {
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
        self.title.text = self.cardTableViewCellVM?.cardInfo?.title
        self.iconImage.image = self.cardTableViewCellVM?.cardInfo?.image
    }
}
