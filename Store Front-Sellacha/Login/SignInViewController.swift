//
//  SignInViewController.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 26/01/24.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var buttonlogin: UIButton!
    @IBOutlet weak var buttonForgotPssword: UILabel!
    @IBOutlet weak var imageEye: UIImageView!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var userNameView: UIView!
    @IBOutlet weak var signinScrollView: UIScrollView!
    var vm  = SignInViewModel()
    var isSignInClicked:(()->())?
    var iconClick = true

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.hideKeyboardWhenTappedAround()
    }
    
    func setupView() {
        self.passwordView.layer.cornerRadius = 2
        self.userNameView.layer.cornerRadius = 2

        self.buttonlogin.backgroundColor = CommonConfig.colors.themeColor
        self.buttonlogin.layer.cornerRadius = 15

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        imageEye.isUserInteractionEnabled = true
        imageEye.addGestureRecognizer(tapGestureRecognizer)
    }
        
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                signinScrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        signinScrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }

    @IBAction func actionClose(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func actionLogin(_ sender: Any) {
        self.dismiss(animated: true)
        self.isSignInClicked?()
        UserDefaults.standard.setValue(true, forKey: "isLoggedIn")
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer){
        if iconClick {
            passwordField.isSecureTextEntry = false
        } else {
            passwordField.isSecureTextEntry = true
        }
        iconClick = !iconClick
    }
}
