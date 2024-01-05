//
//  CategoryCollectionViewCell.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 05/01/24.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
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
//        if self.categoryCollectionViewCellVM?.isStylistCell() == true {
//            self.stylistImage.image = UIImage(systemName: "person.fill")
//            self.stylistImage.tintColor = UIColor(red: 102/255, green: 74/255, blue: 151/255, alpha: 1)
//            self.stylistImage.backgroundColor = UIColor(red: 249/255, green: 246/255, blue: 255/255, alpha: 1)
//        } else {
//            self.stylistImage.image = UIImage(named: "person.fill")
//        }
        self.nameLabel.text = self.categoryCollectionViewCellVM?.getPrice()
        self.addressLabel.text = self.categoryCollectionViewCellVM?.getDescription()
//        if self.categoryCollectionViewCellVM?.getRating() == "0.0" {
//            self.rating.image = UIImage()
//            self.ratingCountLabel.text = ""
//        } else {
//            self.rating.image = UIImage(named: "One Star")
//            self.ratingCountLabel.text = self.categoryCollectionViewCellVM?.getRating()
//        }
        self.ratingCountLabel.text = self.categoryCollectionViewCellVM?.getRating()

    
    //    self.stylistImage.loadImageUsingURL(self.categoryCollectionViewCellVM?.getImageURL() ?? "")
//        if (self.categoryCollectionViewCellVM?.isSelected() ?? false) && !(isFromDetailScreen ?? false) {
//            self.overView.backgroundColor = UIColor(red: 102/255, green: 74/255, blue: 151/255, alpha: 1)
//            self.nameLabel.textColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
//            self.ratingCountLabel.textColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
//            self.addressLabel.textColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
//        } else {
//            self.overView.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
//            self.nameLabel.textColor = UIColor(red: 45/255, green: 41/255, blue: 51/255, alpha: 1)
//            self.ratingCountLabel.textColor = UIColor(red: 45/255, green: 41/255, blue: 51/255, alpha: 1)
//            self.addressLabel.textColor = UIColor(red: 45/255, green: 41/255, blue: 51/255, alpha: 1)
//        }
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
