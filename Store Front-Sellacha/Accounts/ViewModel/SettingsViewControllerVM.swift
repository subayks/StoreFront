//
//  SettingsViewControllerVM.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 16/01/24.
//

import Foundation
import UIKit
struct SettingsModel {
    var image: UIImage?
    var title: String?
    var subTitle: String?
}

class SettingsViewControllerVM: BaseViewModel {
    var settingsArray: [SettingsModel]?
    
    func createDataStructure() {
        var settingsArray = [SettingsModel]()
        
        var settingsModel = SettingsModel()
        settingsModel.image = UIImage(named: "Male Profile")
        settingsModel.title = "Full Name"
        settingsModel.subTitle = "Sana Khan"
        
        settingsArray.append(settingsModel)
        
        settingsModel.image = UIImage(named: "Email")
        settingsModel.title = "Email"
        settingsModel.subTitle = "Sana@gmail.com"
        
        settingsArray.append(settingsModel)
        
        settingsModel.image = UIImage(named: "Phone")
        settingsModel.title = "Phone Number"
        settingsModel.subTitle = "+91 9489588595"
        
        settingsArray.append(settingsModel)
        
        settingsModel.image = UIImage(named: "Language")
        settingsModel.title = "Language"
        settingsModel.subTitle = "English"
        
        settingsArray.append(settingsModel)
        
        settingsModel.image = UIImage(named: "lock-front-color")
        settingsModel.title = "Password issue"
        settingsModel.subTitle = "Change Password"
        
        settingsArray.append(settingsModel)
        
        settingsModel.image = UIImage(named: "Terms and Conditions")
        settingsModel.title = "Terms Policy"
        settingsModel.subTitle = "Terms & Condition"
        
        settingsArray.append(settingsModel)
        
        self.settingsArray = settingsArray
    }
    
    func getSettingsTableViewCellVM(index: Int) ->SettingsTableViewCellVM {
        return SettingsTableViewCellVM(settingsModel: self.settingsArray?[index] ?? SettingsModel())
    }
}
