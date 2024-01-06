//
//  CategoriesListCollectionViewCell.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 05/01/24.
//

import UIKit

class CategoriesListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var offerImage: UIImageView!
    
    var offersCollectionViewCellVM: OffersCollectionViewCellVM? {
        didSet {
            self.setupView()
        }
    }
    
    func setupView() {
        self.offerImage.isUserInteractionEnabled = false
        self.offerImage.layer.borderWidth = 1
        self.offerImage.layer.cornerRadius = 10
        self.offerImage.layer.borderColor = UIColor.clear.cgColor
        if self.offersCollectionViewCellVM?.offer?.id == "111" {
            self.offerImage.image = UIImage(named: self.offersCollectionViewCellVM?.getImage() ?? "")
        } else {
        self.offerImage.loadImageUsingURL(self.offersCollectionViewCellVM?.getImage() ?? "")
        }

//        if let url = URL(string: self.offersCollectionViewCellVM?.getImage() ?? "") {
//
//        DispatchQueue.global().async {
//            let data = try? Data(contentsOf: url)
//            DispatchQueue.main.async {
//                self.offerImage.image = UIImage(data: data!)
//            }
//        }
//    }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        //hide or reset anything you want hereafter, for example
      //  self.offerImage.image = nil
    }
}
