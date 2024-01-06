//
//  CategoriesViewController.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 05/01/24.
//

import UIKit

class CategoriesViewController: UIViewController {
    @IBOutlet weak var logoImage: UIImageView!

    var vm = CategoriesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.logoImage.image = CommonConfig.colors.appSmallLogo
    }
    @IBAction func actionWinter(_ sender: Any) {
    }
    @IBAction func actionFormals(_ sender: Any) {
    }
    @IBAction func actionSports(_ sender: Any) {
    }
    @IBAction func actionBride(_ sender: Any) {
    }
    @IBAction func actionMen(_ sender: Any) {
    }
    @IBAction func actionKids(_ sender: Any) {
    }
    
    @IBAction func actionWomen(_ sender: Any) {
    }
}

