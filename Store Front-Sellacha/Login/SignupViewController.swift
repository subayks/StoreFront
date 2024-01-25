//
//  SignupViewController.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 25/01/24.
//

import UIKit

class SignupViewController: UIViewController {

    @IBOutlet weak var signupScrollView: UIScrollView!
    @IBOutlet weak var mobilenumberOverView: UIView!
    @IBOutlet weak var emailOverView: UIView!
    @IBOutlet weak var userNameOverView: UIView!
    @IBOutlet weak var buttonContinue: UIButton!
    @IBOutlet weak var phoneNumberField: UITextField!
    @IBOutlet weak var EmailIdField: UITextField!
    @IBOutlet weak var userNameField: UITextField!
    var vm = SignupViewModel()
    var isSignUpClicked:(()->())?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.hideKeyboardWhenTappedAround()
    }
    
    func setupView() {
        self.mobilenumberOverView.layer.cornerRadius = 2
        self.emailOverView.layer.cornerRadius = 2
        self.userNameOverView.layer.cornerRadius = 2

        self.buttonContinue.backgroundColor = CommonConfig.colors.themeColor
        self.buttonContinue.layer.cornerRadius = 15

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
        
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                signupScrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        signupScrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }

    @IBAction func actionClose(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func actionContiune(_ sender: Any) {
        self.dismiss(animated: true)
        self.isSignUpClicked?()
    }
}


