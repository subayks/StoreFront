//
//  SettingsTableViewCell.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 16/01/24.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {

    @IBOutlet weak var overView: UIView!
    @IBOutlet weak var subTitle: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var iconImage: UIImageView!
    var vm: SettingsTableViewCellVM? {
        didSet {
            self.setupView()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        self.overView.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupView() {
        self.iconImage.image = self.vm?.settingsModel?.image
        self.titleLabel.text = self.vm?.settingsModel?.title
        self.subTitle.text = self.vm?.settingsModel?.subTitle
    }

}
