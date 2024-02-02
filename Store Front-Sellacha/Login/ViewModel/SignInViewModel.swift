//
//  SignInViewModel.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 26/01/24.
//

import Foundation

class SignInViewModel: BaseViewModel {
    var apiServices: LoginApiServiceprotocol?
    var loginModel: LoginModel?

    init(apiServices: LoginApiServiceprotocol = LoginApiService()) {
        self.apiServices = apiServices
    }
    
    func makeSignIn(email: String, password: String) {
        if Reachability.isConnectedToNetwork() {
            self.showLoadingIndicatorClosure?()
            
            let param =  self.getLoginParam(email: email, password: password)
            
            self.apiServices?.makeLogin(finalURL: "\(CommonConfig.url.finalURL)/login-user", httpHeaders: [String:String](), withParameters: param, completion: { (status: Bool? , errorCode: String?,result: AnyObject?, errorMessage: String?) -> Void in
                DispatchQueue.main.async {
                    self.hideLoadingIndicatorClosure?()
                    if status == true  {
                        let model  = result as? BaseResponse<LoginModel>
                        self.loginModel = model?.data
                        if  self.loginModel?.email != "" {
                            let token = "Bearer " + (self.loginModel?.token ?? "")
                            print(token)
                            UserDefaults.standard.setValue(token, forKey: "AuthToken")
                            UserDefaults.standard.setValue(true, forKey: "isLoggedIn")
                            UserDefaults.standard.setValue(self.loginModel?.email ?? "", forKey: "email")
                            UserDefaults.standard.setValue(self.loginModel?.name ?? "", forKey: "userName")
                            self.navigationClosure?()
                        } else {
                            self.alertClosure?(errorMessage ?? "Some Technical Problem")
                        }
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
    
    func getLoginParam(email: String, password: String) ->String {
    let jsonToReturn: NSDictionary = ["email": "\(email)",
                                      "password": "\(password)"]
    return self.convertDictionaryToJsonString(dict: jsonToReturn)!
    }
    
    func validateFields(email: String, password: String) {
        
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
        
        self.makeSignIn(email: email, password: password)
    }
    
}
