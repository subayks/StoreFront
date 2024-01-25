//
//  HomeTabbarController.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 07/01/24.
//

import UIKit

class HomeTabbarController: UITabBarController, UITabBarControllerDelegate {

    @IBOutlet weak var MenuTabBar: UITabBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MenuTabBar.tintColor = CommonConfig.colors.themeColor
        self.delegate = self
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
      // you need a reference to your nav controller
      if let navController = tabBarController.selectedViewController as? UINavigationController {
        navController.popToRootViewController(animated: false)
      }

      return true
    }

    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if tabBar.selectedItem?.title == "Home" {
            self.selectedIndex = 0
        } else if tabBar.selectedItem?.title == "Categories" {
            self.selectedIndex = 1
        } else if tabBar.selectedItem?.title == "Account" {
            self.selectedIndex = 2
        } else {
            self.selectedIndex = 3
        }
    }
}
