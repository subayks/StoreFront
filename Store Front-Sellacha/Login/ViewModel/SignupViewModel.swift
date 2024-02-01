//
//  SignupViewModel.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 25/01/24.
//

import Foundation
class SignupViewModel: BaseViewModel {
    var apiServices: LoginApiServiceprotocol?
    var loginModel: LoginModel?

    init(apiServices: LoginApiServiceprotocol = LoginApiService()) {
        self.apiServices = apiServices
    }
    
    func makeSignup(name: String,email: String, password: String, phoneNumber: String) {
        if Reachability.isConnectedToNetwork() {
            self.showLoadingIndicatorClosure?()
            
            let param =  self.getLoginParam(name: name,email: email, password: password, phoneNumber: phoneNumber)
            
            self.apiServices?.makeSignUp(finalURL: "\(CommonConfig.url.finalURL)/register-user", httpHeaders: [String:String](), withParameters: param, completion: { (status: Bool? , errorCode: String?,result: AnyObject?, errorMessage: String?) -> Void in
                DispatchQueue.main.async {
                    self.hideLoadingIndicatorClosure?()
                    if status == true {
                        let model  = result as? BaseResponse<LoginModel>
                        self.loginModel = model?.data
                        UserDefaults.standard.setValue(phoneNumber, forKey: "phoneNumber")
                         UserDefaults.standard.setValue(email, forKey: "email")
                         UserDefaults.standard.setValue(name, forKey: "userName")

                        self.navigationClosure?()
                    }
                    else{
                        self.alertClosure?(errorMessage ?? "Some Technical Problem")
                    }
                }
            })
        }
        else {
            self.alertClosure?("No Internet Availabe")
        }
    }
    
    func getLoginParam(name: String,email: String, password: String, phoneNumber: String) ->String {
    let jsonToReturn: NSDictionary = ["email": "\(email)",
                                      "password": "\(password)","name": "\(name)","mobile": "\(phoneNumber)"]
    return self.convertDictionaryToJsonString(dict: jsonToReturn)!
    }
    
    func validateFields(name: String,email: String, password: String, phoneNumber: String) {
        
        if name == "" || (name.trimmingCharacters(in: .whitespaces).isEmpty) {
            self.alertClosure?("Please enter Name")
            return
        }
        
        if phoneNumber == "" || (phoneNumber.trimmingCharacters(in: .whitespaces).isEmpty) {
            self.alertClosure?("Please enter Valid mobile Number")
            return
        }

        if phoneNumber.count > 10 || phoneNumber.count < 10 {
            self.alertClosure?("Please enter Valid mobile Number")
            return
        }
        
        if email == "" || (email.trimmingCharacters(in: .whitespaces).isEmpty) {
            self.alertClosure?("Please enter valid Email Address")
            return
        }

        if !isValidEmail(email) {
            self.alertClosure?("Please enter valid Email Address")
            return
        }
        
        if password == "" || (password.trimmingCharacters(in: .whitespaces).isEmpty) {
            self.alertClosure?("Please enter Password")

            return
        }

        if (password.count) < 8 {
            self.alertClosure?("Please enter Min 8 character in password field")
            return
        }
        
        self.makeSignup(name: name, email: email, password: password, phoneNumber: phoneNumber)
    }
    
}
