//
//  ItemImageTableViewCell.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 26/01/24.
//

import UIKit

class ItemImageTableViewCell: UITableViewCell {

    @IBOutlet weak var itemDesc: UILabel!
    @IBOutlet weak var ratingCount: UILabel!
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
