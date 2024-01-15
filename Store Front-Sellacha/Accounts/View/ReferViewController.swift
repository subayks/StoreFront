//
//  ReferViewController.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 15/01/24.
//

import UIKit

class ReferViewController: UIViewController {

    @IBOutlet weak var buttonShare: UIButton!
    @IBOutlet weak var buttonCopyUrl: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.buttonCopyUrl.layer.cornerRadius = 15
        self.buttonShare.layer.cornerRadius = 15
        
        self.buttonCopyUrl.layer.borderWidth = 1
        self.buttonCopyUrl.layer.borderColor = CommonConfig.colors.themeColor.cgColor
        
        self.buttonShare.backgroundColor = CommonConfig.colors.themeColor
        self.buttonShare.layer.borderWidth = 1
        self.buttonShare.layer.borderColor = UIColor.white.cgColor
    }
    
    @IBAction func actionCopyLink(_ sender: Any) {
    }
    
    @IBAction func actionShare(_ sender: Any) {
    }
}
