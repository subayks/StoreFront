//
//  CardsViewController.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 10/01/24.
//

import UIKit

class CardsViewController: UIViewController {

    @IBOutlet weak var actionSave: UIButton!
    @IBOutlet weak var securityField: UITextField!
    @IBOutlet weak var expiryTextField: UITextField!
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var NameTextField: UITextField!
    @IBOutlet weak var SecurityOverView: UIView!
    @IBOutlet weak var ExpiryOverView: UIView!
    @IBOutlet weak var cardNoOverView: UIView!
    @IBOutlet weak var nameOverView: UIView!
    var vm = CardsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.actionSave.backgroundColor = CommonConfig.colors.themeColor
        self.actionSave.layer.cornerRadius = 10
        self.setupNavigationBar()
    }
    
    @IBAction func actionContinue(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
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
}
