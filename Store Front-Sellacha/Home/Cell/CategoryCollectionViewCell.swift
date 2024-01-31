//
//  CategoryCollectionViewCell.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 05/01/24.
//

import UIKit
import SDWebImageWebPCoder

class CategoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var ogPriceLabel: UILabel!
    @IBOutlet weak var ratingCountLabel: UILabel!
    @IBOutlet weak var rating: UIImageView!
    @IBOutlet weak var stylistImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var overView: UIView!
    @IBOutlet weak var addressLabel: UILabel!
    
    var isFromDetailScreen: Bool?
    var categoryCollectionViewCellVM: CategoryCollectionViewCellVM? {
        didSet {
            self.setupView()
        }
    }
    
    func setupView() {
        self.overView.layer.borderWidth = 1
        self.overView.layer.cornerRadius = 15
        self.contentView.layer.cornerRadius = 15
        self.overView.layer.borderColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1).cgColor
        self.overView.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        self.stylistImage.layer.borderWidth = 1
        self.stylistImage.layer.borderColor = UIColor.clear.cgColor
        stylistImage.layer.cornerRadius = 10
        self.ogPriceLabel.addStrikethrough(.thick, strikethroughColor: UIColor(red: 117/255, green: 117/255, blue: 117/255, alpha: 255/255))
        if self.categoryCollectionViewCellVM?.getPrice() != 0 {
            self.nameLabel.text = "\(self.categoryCollectionViewCellVM?.getPrice() ?? 0)"
        } else {
            self.nameLabel.text = "\(self.categoryCollectionViewCellVM?.getOgPrice() ?? 0)"
            self.ogPriceLabel.text = ""
        }
        if self.categoryCollectionViewCellVM?.getOgPrice() != 0 &&  self.categoryCollectionViewCellVM?.getPrice() != 0 {
            self.ogPriceLabel.text = "\(self.categoryCollectionViewCellVM?.getOgPrice() ?? 0)"
        }
        self.addressLabel.text = self.categoryCollectionViewCellVM?.getDescription()
        self.ratingCountLabel.text = self.categoryCollectionViewCellVM?.getRating()
        
        
        let webPCoder = SDImageWebPCoder.shared
        SDImageCodersManager.shared.addCoder(webPCoder)
        let urlString = "https://\(String(describing: self.categoryCollectionViewCellVM?.getImageURL().dropFirst(2) ?? ""))"
        if let webpURL = URL(string: urlString)  {
            DispatchQueue.main.async {
                self.stylistImage.sd_setImage(with: webpURL)
            }
        } else {
            self.stylistImage.image = UIImage(named: "Sample Image")
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        //hide or reset anything you want hereafter, for example
        self.nameLabel.text = nil
        self.ratingCountLabel.text = nil
        self.addressLabel.text = nil
        self.stylistImage.image = nil
    }
}
