//
//  ItemImageTableViewCell.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 26/01/24.
//

import UIKit
import SDWebImageWebPCoder

class ItemImageTableViewCell: UITableViewCell {

    @IBOutlet weak var itemDesc: UILabel!
    @IBOutlet weak var ratingCount: UILabel!
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
    
    var itemImageTableViewCellVM: ItemImageTableViewCellVM? {
        didSet {
            self.setValues()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    func setValues() {
        self.itemDesc.text = self.itemImageTableViewCellVM?.ordersInfo?.itemDesc ?? ""
        self.ratingCount.text = self.itemImageTableViewCellVM?.ordersInfo?.ratingCount ?? ""
        self.itemName.text = self.itemImageTableViewCellVM?.ordersInfo?.itemName ?? ""
        let webPCoder = SDImageWebPCoder.shared
        SDImageCodersManager.shared.addCoder(webPCoder)
        let urlString = "https://\(String(describing: self.itemImageTableViewCellVM?.ordersInfo?.itemImage?.dropFirst(2) ?? ""))"
        if let webpURL = URL(string: urlString)  {
            DispatchQueue.main.async {
                self.itemImage.sd_setImage(with: webpURL)
            }
        } else {
            self.itemImage.image = UIImage(named: "Sample Image")
        }
    }
}
