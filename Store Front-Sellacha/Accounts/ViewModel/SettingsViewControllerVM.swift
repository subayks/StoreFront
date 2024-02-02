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
    var userInfoModel: UserInfoModel?
    var settingsArray: [SettingsModel]?
    var apiServices: AccountsApiServiceProtocol?

    init(apiServices: AccountsApiServiceProtocol = AccountsApiService()) {
        self.apiServices = apiServices
    }
    
    init(userInfoModel: UserInfoModel,apiServices: AccountsApiServiceProtocol = AccountsApiService()) {
        self.userInfoModel = userInfoModel
        self.apiServices = apiServices
    }
    
    
    func createDataStructure() {
        var settingsArray = [SettingsModel]()
        
        var settingsModel = SettingsModel()
        settingsModel.image = UIImage(named: "Male Profile")
        settingsModel.title = "Full Name"
        settingsModel.subTitle = self.userInfoModel?.check?.name ?? ""
        
        settingsArray.append(settingsModel)
        
        settingsModel.image = UIImage(named: "Email")
        settingsModel.title = "Email"
        settingsModel.subTitle = self.userInfoModel?.check?.email ?? ""
        
        settingsArray.append(settingsModel)
        
        settingsModel.image = UIImage(named: "Phone")
        settingsModel.title = "Phone Number"
        settingsModel.subTitle = self.userInfoModel?.check?.mobile ?? ""
        
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
