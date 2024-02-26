//
//  AddressViewController.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 10/01/24.
//

import UIKit

class AddressViewController: UIViewController {

    @IBOutlet weak var zipcodeField: UITextField!
    @IBOutlet weak var zipcodeLabel: UILabel!
    @IBOutlet weak var zipcodeView: UIView!
    @IBOutlet weak var addressScrollView: UIScrollView!
    @IBOutlet weak var buttonSave: UIButton!
    @IBOutlet weak var stateNameField: UITextField!
    @IBOutlet weak var cityNameField: UITextField!
    @IBOutlet weak var stateOverView: UIView!
    @IBOutlet weak var cityOverView: UIView!
    @IBOutlet weak var addressOverview: UIView!
    @IBOutlet weak var addressField: UITextField!
    var addressClosure:((AddressInfo)->())?

    var vm = AddressViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.hideKeyboardWhenTappedAround()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        self.buttonSave.backgroundColor = CommonConfig.colors.themeColor
        self.buttonSave.layer.cornerRadius = 10
        self.setupNavigationBar()
    }

    @IBAction func actionSave(_ sender: Any) {
        let mobileNumber = UserDefaults.standard.string(forKey: "phoneNumber") ?? ""
        if self.addressField.text != "" && self.cityNameField.text != "" && self.stateNameField.text != "" && self.zipcodeField.text != "" {
            self.addressClosure?(AddressInfo(streetName: self.addressField.text ?? "",city: self.cityNameField.text ?? "", state: self.stateNameField.text ?? "", mob: mobileNumber, zipCode: self.zipcodeField.text ?? ""))
            self.navigationController?.popViewController(animated: true)
        } else {
            let alert = UIAlertController(title: "Alert", message: "Please Fill All Mandatory Fields", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                addressScrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        addressScrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func setupNavigationBar() {
        self.navigationItem.title = "Delivery Address"
        self.navigationController?.isNavigationBarHidden = false
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.white
        appearance.titleTextAttributes = [.font: UIFont(name: "Roboto-Medium", size: 16)!,
                                          .foregroundColor: UIColor.black]
        
        // Customizing our navigation bar
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
}

extension AddressViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn _: NSRange, replacementString string: String) -> Bool {
        if textField.isFirstResponder {
            let validString = CharacterSet(charactersIn: " !@#$%^&*()_+{}[]|\"<>,.~`/:;?-=\\¥'£•¢")
            
            if (textField.textInputMode?.primaryLanguage == "emoji") || textField.textInputMode?.primaryLanguage == nil {
                return false
            }
            if let range = string.rangeOfCharacter(from: validString)
            {
                print(range)
                return false
            }
        }
        return true
    }
}
