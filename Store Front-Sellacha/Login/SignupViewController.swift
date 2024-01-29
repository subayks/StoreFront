//
//  SignupViewController.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 25/01/24.
//

import UIKit

class SignupViewController: UIViewController {
    
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var signupScrollView: UIScrollView!
    @IBOutlet weak var imageEye: UIImageView!
    @IBOutlet weak var mobilenumberOverView: UIView!
    @IBOutlet weak var emailOverView: UIView!
    @IBOutlet weak var userNameOverView: UIView!
    @IBOutlet weak var buttonContinue: UIButton!
    @IBOutlet weak var phoneNumberField: UITextField!
    @IBOutlet weak var EmailIdField: UITextField!
    @IBOutlet weak var userNameField: UITextField!
    var viewwModel = SignupViewModel()
    var isSignUpClicked:(()->())?
    var iconClick = true

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.hideKeyboardWhenTappedAround()
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        imageEye.isUserInteractionEnabled = true
        imageEye.addGestureRecognizer(tapGestureRecognizer)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.viewwModel.errorClosure = { [weak self] (error) in
            DispatchQueue.main.async {
                guard let self = self else {return}
                if error != "" {
                    let alert = UIAlertController(title: "Alert", message: error, preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
        
        self.viewwModel.alertClosure = { [weak self] (error) in
            DispatchQueue.main.async {
                guard let self = self else {return}
                let alert = UIAlertController(title: "Alert", message: error, preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
        
        self.viewwModel.showLoadingIndicatorClosure = { [weak self] in
            DispatchQueue.main.async {
                guard let self = self else {return}
                self.showSpinner(onView: self.view)
            }
        }
        
        self.viewwModel.hideLoadingIndicatorClosure = { [weak self] in
            DispatchQueue.main.async {
                guard let self = self else {return}
                self.removeSpinner()
            }
        }
        
        self.viewwModel.navigationClosure = { [weak self] in
            DispatchQueue.main.async {
                guard let self = self else {return}
                self.dismiss(animated: true)
                self.isSignUpClicked?()
//                let storyboard = UIStoryboard(name: "Main", bundle: nil)
//                let tabBarController = storyboard.instantiateViewController(identifier: "TabBarController")
//                (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(tabBarController)
            }
        }
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
        self.viewwModel.validateFields(name: self.userNameField.text ?? "", email: self.EmailIdField.text ?? "", password: self.passwordField.text ?? "", phoneNumber: self.phoneNumberField.text ?? "")
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer){
        if iconClick {
            passwordField.isSecureTextEntry = false
            self.imageEye.image = UIImage(systemName: "eye.slash.fill")
        } else {
            passwordField.isSecureTextEntry = true
            self.imageEye.image = UIImage(named: "Eye")
        }
        iconClick = !iconClick
    }
}


