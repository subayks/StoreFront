//
//  AddressViewController.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 10/01/24.
//

import UIKit

class AddressViewController: UIViewController {

    @IBOutlet weak var addressScrollView: UIScrollView!
    @IBOutlet weak var buttonSave: UIButton!
    @IBOutlet weak var stateNameField: UITextField!
    @IBOutlet weak var cityNameField: UITextField!
    @IBOutlet weak var stateOverView: UIView!
    @IBOutlet weak var cityOverView: UIView!
    @IBOutlet weak var addressOverview: UIView!
    @IBOutlet weak var addressField: UITextField!
    var vm = AddressViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.buttonSave.backgroundColor = CommonConfig.colors.themeColor
        self.buttonSave.layer.cornerRadius = 10
        self.setupNavigationBar()
    }

    @IBAction func actionSave(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
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
