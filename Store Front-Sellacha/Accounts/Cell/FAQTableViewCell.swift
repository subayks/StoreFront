//
//  FAQTableViewCell.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 18/01/24.
//

import UIKit

class FAQTableViewCell: UITableViewCell {

    @IBOutlet weak var queLabel: UILabel!
    @IBOutlet weak var overView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.overView.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
