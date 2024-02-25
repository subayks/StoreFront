//
//  CartTableViewCell.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 06/01/24.
//

import UIKit
import SDWebImageWebPCoder
enum OperationType {
    case add
    case minus
}

class CartTableViewCell: UITableViewCell {

    @IBOutlet weak var overView: UIView!
    @IBOutlet weak var ProductImage: UIImageView!
    @IBOutlet weak var countBackGround: UIView!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var addImage: UIImageView!
    @IBOutlet weak var deleteImage: UIImageView!
    @IBOutlet weak var slashView: UIView!
    @IBOutlet weak var offerPrice: UILabel!
    @IBOutlet weak var finalPrice: UILabel!
    @IBOutlet weak var labelColorInfo: UILabel!
    @IBOutlet weak var labelTitle: UILabel!
    var countClosure:((Int, OperationType)->())?
    
    var cartTableViewCellVM: CartTableViewCellVM? {
        didSet {
            self.setupView()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.countBackGround.backgroundColor = CommonConfig.colors.themeColor
        
        let addTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        addImage.isUserInteractionEnabled = true
        addImage.addGestureRecognizer(addTapGestureRecognizer)
        
        let deleteTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(deleteImageTapped(tapGestureRecognizer:)))
        deleteImage.isUserInteractionEnabled = true
        deleteImage.addGestureRecognizer(deleteTapGestureRecognizer)
        self.offerPrice.addStrikethrough(.single, strikethroughColor: UIColor(red: 117/255, green: 117/255, blue: 117/255, alpha: 255/255))

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupView() {
        self.cartTableViewCellVM?.currentCount = Int(self.cartTableViewCellVM?.productInfo?.qty ?? "")
        self.labelTitle.text = self.cartTableViewCellVM?.productInfo?.termTitle ?? ""
        self.countLabel.text = self.cartTableViewCellVM?.productInfo?.qty ?? ""
        self.offerPrice.text = ""
        self.finalPrice.text =  "₹" + (self.cartTableViewCellVM?.productInfo?.price ?? "")
        self.ProductImage.layer.cornerRadius = 10
        let webPCoder = SDImageWebPCoder.shared
        SDImageCodersManager.shared.addCoder(webPCoder)
        let urlString = "https://\(String(describing: self.cartTableViewCellVM?.productInfo?.preview?.dropFirst(2) ?? ""))"
        if let webpURL = URL(string: urlString)  {
            DispatchQueue.main.async {
                self.ProductImage.sd_setImage(with: webpURL)
            }
        } else {
            self.ProductImage.image = UIImage(named: "Sample Image")
        }
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        self.cartTableViewCellVM?.currentCount = (self.cartTableViewCellVM?.currentCount ?? 0) + 1
        self.countClosure?(self.cartTableViewCellVM?.currentCount ?? 0, .add)
    }
    
    @objc func deleteImageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        if self.cartTableViewCellVM?.currentCount ?? 0 > 0 {
            self.cartTableViewCellVM?.currentCount = (self.cartTableViewCellVM?.currentCount ?? 0) - 1
            self.countClosure?(self.cartTableViewCellVM?.currentCount ?? 0, .minus)
        }
    }

}
