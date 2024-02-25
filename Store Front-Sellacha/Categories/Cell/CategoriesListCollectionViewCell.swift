//
//  CategoriesListCollectionViewCell.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 05/01/24.
//

import UIKit

class CategoriesListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var offerImage: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    var vm: CategoriesListCollectionViewCellVM? {
        didSet {
            self.setupView()
        }
    }
    
    func setupView() {
        self.offerImage.isUserInteractionEnabled = false
        self.offerImage.layer.borderWidth = 1
        self.offerImage.layer.cornerRadius = 10
        self.offerImage.layer.borderColor = UIColor.clear.cgColor
        self.titleLabel.text = self.vm?.categoryData?.name ?? ""
        let urlString = "\(CommonConfig.url.imageBaseUrl)\(self.vm?.categoryData?.preview?.content ?? "")"
        if let webpURL = URL(string: urlString)  {
            DispatchQueue.main.async {
                self.offerImage.sd_setImage(with: webpURL)
            }
        } else {
            self.offerImage.image = UIImage(named: "Sample Image")
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        //hide or reset anything you want hereafter, for example
      //  self.offerImage.image = nil
    }
}
