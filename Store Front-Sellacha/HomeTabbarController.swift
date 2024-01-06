//
//  HomeTabbarController.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 07/01/24.
//

import UIKit

class HomeTabbarController: UITabBarController {

    @IBOutlet weak var MenuTabBar: UITabBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MenuTabBar.tintColor = CommonConfig.colors.themeColor
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
