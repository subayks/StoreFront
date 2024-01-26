//
//  SizeTableViewCell.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 26/01/24.
//

import UIKit

class SizeTableViewCell: UITableViewCell {
    @IBOutlet weak var buttonSmall: UIButton!
    
    @IBOutlet weak var buttonBig: UIButton!
    @IBOutlet weak var buttonMedium: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.buttonSmall.layer.cornerRadius = 10
        self.buttonBig.layer.cornerRadius = 10
        self.buttonMedium.layer.cornerRadius = 10

        self.buttonSmall.layer.borderWidth = 1
        self.buttonBig.layer.borderWidth = 1
        self.buttonMedium.layer.borderWidth = 1

        self.buttonSmall.layer.borderColor = CommonConfig.colors.themeColor.cgColor
        self.buttonSmall.setTitleColor(CommonConfig.colors.themeColor, for: .normal)
        
        self.buttonMedium.layer.borderColor = UIColor.clear.cgColor
        self.buttonMedium.setTitleColor(UIColor(red: 117/255, green: 117/255, blue: 117/255, alpha: 255/255), for: .normal)
        
        self.buttonBig.layer.borderColor = UIColor.clear.cgColor
        self.buttonBig.setTitleColor(UIColor(red: 117/255, green: 117/255, blue: 117/255, alpha: 255/255), for: .normal)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func actionBig(_ sender: Any) {
        self.buttonSmall.layer.borderColor = UIColor.clear.cgColor
        self.buttonSmall.setTitleColor(UIColor(red: 117/255, green: 117/255, blue: 117/255, alpha: 255/255), for: .normal)
        
        self.buttonMedium.layer.borderColor = UIColor.clear.cgColor
        self.buttonMedium.setTitleColor(UIColor(red: 117/255, green: 117/255, blue: 117/255, alpha: 255/255), for: .normal)
        
        self.buttonBig.layer.borderColor = CommonConfig.colors.themeColor.cgColor
        self.buttonBig.setTitleColor(CommonConfig.colors.themeColor, for: .normal)
    }
    
    @IBAction func actionSmall(_ sender: Any) {
        self.buttonSmall.layer.borderColor = CommonConfig.colors.themeColor.cgColor
        self.buttonSmall.setTitleColor(CommonConfig.colors.themeColor, for: .normal)
        
        self.buttonMedium.layer.borderColor = UIColor.clear.cgColor
        self.buttonMedium.setTitleColor(UIColor(red: 117/255, green: 117/255, blue: 117/255, alpha: 255/255), for: .normal)
        
        self.buttonBig.layer.borderColor = UIColor.clear.cgColor
        self.buttonBig.setTitleColor(UIColor(red: 117/255, green: 117/255, blue: 117/255, alpha: 255/255), for: .normal)
    }
    
    @IBAction func actionMEdium(_ sender: Any) {
        self.buttonSmall.layer.borderColor = UIColor.clear.cgColor
        self.buttonSmall.setTitleColor(UIColor(red: 117/255, green: 117/255, blue: 117/255, alpha: 255/255), for: .normal)
        
        self.buttonMedium.layer.borderColor = CommonConfig.colors.themeColor.cgColor
        self.buttonMedium.setTitleColor(CommonConfig.colors.themeColor, for: .normal)
        
        self.buttonBig.layer.borderColor = UIColor.clear.cgColor
        self.buttonBig.setTitleColor(UIColor(red: 117/255, green: 117/255, blue: 117/255, alpha: 255/255), for: .normal)
    }
    
}
