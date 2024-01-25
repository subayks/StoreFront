//
//  LoginOrSignUpViewController.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 25/01/24.
//

import UIKit

class LoginOrSignUpViewController: UIViewController {
    @IBOutlet weak var buttonSignUp: UIButton!
    @IBOutlet weak var buttonLogin: UIButton!
    var isSignInClicked:((Bool)->())?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.buttonSignUp.layer.cornerRadius = 15
        self.buttonLogin.layer.cornerRadius = 15
        
        self.buttonSignUp.layer.borderWidth = 2
        self.buttonSignUp.layer.borderColor = CommonConfig.colors.themeColor.cgColor
        
        self.buttonLogin.backgroundColor = CommonConfig.colors.themeColor
    }

    @IBAction func actionSignUp(_ sender: Any) {
        self.dismiss(animated: true)
        self.isSignInClicked?(false)
    }
    
    @IBAction func actionSignin(_ sender: Any) {
        self.dismiss(animated: true)
        self.isSignInClicked?(true)

    }
}
