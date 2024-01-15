//
//  AddCardTableViewCell.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 15/01/24.
//

import UIKit

class AddCardTableViewCell: UITableViewCell {

    @IBOutlet weak var addCardButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.addCardButton.layer.cornerRadius = 15
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
