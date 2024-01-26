//
//  ColorTableViewCell.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 26/01/24.
//

import UIKit

class ColorTableViewCell: UITableViewCell {

    @IBOutlet weak var color3button: UIButton!
    @IBOutlet weak var color3View: UIView!
    @IBOutlet weak var color2Button: UIButton!
    @IBOutlet weak var color2View: UIView!
    @IBOutlet weak var color1View: UIView!
    @IBOutlet weak var color1Button: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        color1View.layer.masksToBounds = false
        color1View.layer.cornerRadius = color1View.frame.size.width / 2
        color1Button.layer.cornerRadius = color1Button.frame.size.width / 2
        color1View.clipsToBounds = true
        self.color1View.layer.borderWidth = 1
        self.color1View.layer.borderColor = UIColor.black.cgColor
        
        color2View.layer.masksToBounds = false
        color2View.layer.cornerRadius = color2View.frame.size.width / 2
        color2Button.layer.cornerRadius = color2Button.frame.size.width / 2

        color2View.clipsToBounds = true
        self.color2View.layer.borderWidth = 1
        self.color2View.layer.borderColor = UIColor.clear.cgColor
        
        color3View.layer.masksToBounds = false
        color3View.layer.cornerRadius = color3View.frame.size.width / 2
        color3button.layer.cornerRadius = color3button.frame.size.width / 2
        color3View.clipsToBounds = true
        
        self.color3View.layer.borderWidth = 1
        self.color3View.layer.borderColor = UIColor.clear.cgColor
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func actionColor1(_ sender: Any) {
        self.color1View.layer.borderColor = UIColor.black.cgColor
        self.color2View.layer.borderColor = UIColor.clear.cgColor
        self.color3View.layer.borderColor = UIColor.clear.cgColor
    }
    
    @IBAction func actionColor2(_ sender: Any) {
        self.color1View.layer.borderColor = UIColor.clear.cgColor
        self.color2View.layer.borderColor = UIColor.black.cgColor
        self.color3View.layer.borderColor = UIColor.clear.cgColor
    }
    
    @IBAction func actionColor3(_ sender: Any) {
        self.color1View.layer.borderColor = UIColor.clear.cgColor
        self.color2View.layer.borderColor = UIColor.clear.cgColor
        self.color3View.layer.borderColor = UIColor.black.cgColor
    }
}
