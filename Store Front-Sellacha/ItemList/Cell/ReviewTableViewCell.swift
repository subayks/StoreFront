//
//  ReviewTableViewCell.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 26/01/24.
//

import UIKit

class ReviewTableViewCell: UITableViewCell {

    @IBOutlet weak var ratingCount: UILabel!
    @IBOutlet weak var reviewerName: UILabel!
    @IBOutlet weak var reviewDate: UILabel!
    @IBOutlet weak var reviewerImage: UIImageView!
    @IBOutlet weak var buttonviewAll: UIButton!
    @IBOutlet weak var reviewCount: UILabel!
    @IBOutlet weak var imageStar: UIImageView!
    @IBOutlet weak var labelReviewComment: UILabel!
    @IBOutlet weak var imageOverView: UIImageView!
    @IBOutlet weak var overview: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.buttonviewAll.backgroundColor = CommonConfig.colors.themeLightColor
        self.buttonviewAll.setTitleColor(CommonConfig.colors.themeColor, for: .normal)
        
        self.overview.layer.cornerRadius = 10
        self.buttonviewAll.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func actionViewAll(_ sender: Any) {
    }
}
