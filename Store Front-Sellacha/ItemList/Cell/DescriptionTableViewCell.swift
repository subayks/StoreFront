//
//  DescriptionTableViewCell.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 26/01/24.
//

import UIKit

class DescriptionTableViewCell: UITableViewCell {

    @IBOutlet weak var labelDescription: UILabel!
    var descriptionTableViewCellVM: DescriptionTableViewCellVM? {
        didSet {
            self.setValues()
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

    func setValues() {
        self.labelDescription.text = self.descriptionTableViewCellVM?.descModel?.desc ?? ""
    }
}
