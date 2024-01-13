//
//  CardsViewController.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 10/01/24.
//

import UIKit

class CardsViewController: UIViewController {
    
    @IBOutlet weak var cardsScrollView: UIScrollView!
    @IBOutlet weak var actionSave: UIButton!
    @IBOutlet weak var securityField: UITextField!
    @IBOutlet weak var expiryTextField: UITextField!
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var NameTextField: UITextField!
    @IBOutlet weak var SecurityOverView: UIView!
    @IBOutlet weak var ExpiryOverView: UIView!
    @IBOutlet weak var cardNoOverView: UIView!
    @IBOutlet weak var nameOverView: UIView!
    var cardClosure:((CardInfo)->())?
    private var previousTextFieldContent: String?
    private var previousSelection: UITextRange?
    var selectedCardType: String? {
        didSet{
            reformatAsCardNumber(textField: numberTextField)
        }
    }
    
    var vm = CardsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        self.actionSave.backgroundColor = CommonConfig.colors.themeColor
        self.actionSave.layer.cornerRadius = 10
        self.setupNavigationBar()
        numberTextField.addTarget(self, action: #selector(self.reformatAsCardNumber(textField:)), for: UIControl.Event.editingChanged)
        self.expiryTextField.maxLength = 5
        
    }
    
    @IBAction func actionContinue(_ sender: Any) {
        self.cardClosure?(CardInfo(image: UIImage(named: "Card"),title: "****410"))
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                cardsScrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        cardsScrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func setupNavigationBar() {
        self.navigationItem.title = "Add Card"
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
    
    @objc func reformatAsCardNumber(textField:UITextField){
        let formatter = CreditCardFormatter()
        var isAmex = false
        if selectedCardType == "AMEX" {
            isAmex = true
        }
        formatter.formatToCreditCardNumber(isAmex: isAmex, textField: textField, withPreviousTextContent: textField.text, andPreviousCursorPosition: textField.selectedTextRange)
    }
}

extension CardsViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard ((textField.text as NSString?)?.replacingCharacters(in: range, with: string)) != nil else { return true }
        
        if textField == self.expiryTextField{
            if range.length > 0 {
                return true
            }
            if string == "" {
                return false
            }
            if range.location > 4 {
                return false
            }
            var originalText = textField.text
            let replacementText = string.replacingOccurrences(of: " ", with: "")
            
            //Verify entered text is a numeric value
            if !CharacterSet.decimalDigits.isSuperset(of: CharacterSet(charactersIn: replacementText)) {
                return false
            }
            
            //Put / after 2 digit
            if range.location == 2 {
                originalText?.append("/")
                textField.text = originalText
            }
            return true
        } else if textField == self.securityField {
            guard let textFieldText = textField.text,
                  let rangeOfTextToReplace = Range(range, in: textFieldText) else {
                return false
            }
            let substringToReplace = textFieldText[rangeOfTextToReplace]
            let count = textFieldText.count - substringToReplace.count + string.count
            return count <= 3
        } else if textField == self.NameTextField {
            let ACCEPTABLE_CHARACTERS = " ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_."
            let cs = CharacterSet(charactersIn: ACCEPTABLE_CHARACTERS).inverted
            let filtered: String = (string.components(separatedBy: cs) as NSArray).componentsJoined(by: "")
            return (string == filtered)
        }
        return true
    }
}

