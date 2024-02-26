//
//  CompletionViewController.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 10/01/24.
//

import UIKit

class CompletionViewController: UIViewController {

    @IBOutlet weak var viewOrderDetailsLabel: UILabel!
    @IBOutlet weak var buttonAwesome: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.buttonAwesome.backgroundColor = CommonConfig.colors.themeColor
        self.viewOrderDetailsLabel.textColor = CommonConfig.colors.themeColor
        self.buttonAwesome.layer.cornerRadius = 10
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }


    @IBAction func actionAwesome(_ sender: Any) {
        if let viewControllers = self.navigationController?.viewControllers {
            for viewController in viewControllers {
                if viewController is CartViewController {
                    (viewController as! CartViewController).viewModel.getCart()
                    self.navigationController?.popToViewController(viewController, animated: true)
                    self.tabBarController?.selectedIndex = 3
                    return
                }
            }
        }
    }
}
