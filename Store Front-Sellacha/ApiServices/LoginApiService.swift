//
//  LoginApiService.swift
//  SellAcha
//
//  Created by Subaykala on 20/10/23.
//

import Foundation
protocol LoginApiServiceprotocol {
    func makeLogin(finalURL: String, httpHeaders: [String: String], withParameters: String, completion: @escaping(_ status: Bool?, _ code: String?, _ response: AnyObject?, _ error: String?)-> Void)
    func makeSignUp(finalURL: String, httpHeaders: [String: String], withParameters: String, completion: @escaping(_ status: Bool?, _ code: String?, _ response: AnyObject?, _ error: String?)-> Void)
}

class LoginApiService: LoginApiServiceprotocol {
    func makeSignUp(finalURL: String, httpHeaders: [String : String], withParameters: String, completion: @escaping (Bool?, String?, AnyObject?, String?) -> Void) {
        let header = [
            "Authorization": "Bearer 1469|yeMIF3WMX41EcKCE4nSucFB6p015P6r4VLrFH8cM",
        ]
        NetworkAdapter.clientNetworkRequestCodable(withBaseURL: finalURL, withParameters:  withParameters, withHttpMethod: "POST", withContentType: "Application/json", withHeaders: header, completionHandler: { (result: Data?, showPopUp: Bool?, error: String?, errorCode: String?)  -> Void in
            
            if let error = error {
                completion(false,errorCode,nil,error)
                
                return
            }
            
            DispatchQueue.main.async {
                
                do {
                    let decoder = JSONDecoder()
                    if result == nil {
                        completion(false,errorCode,nil,"Unhandled Error")
                        return
                    }
                    let values = try decoder.decode(BaseResponse<LoginModel>.self, from: result!)
                    completion(true,errorCode,values as AnyObject?,error)
                    
                } catch let error as NSError {
                    //do something with error
                    completion(false,errorCode,nil,error.localizedDescription)
                }
                
            }
        }
        )
    }
    
    func makeLogin(finalURL: String, httpHeaders: [String : String], withParameters: String, completion: @escaping (Bool?, String?, AnyObject?, String?) -> Void) {
       
        NetworkAdapter.clientNetworkRequestCodable(withBaseURL: finalURL, withParameters:  withParameters, withHttpMethod: "POST", withContentType: "Application/json", withHeaders: [String:String](), completionHandler: { (result: Data?, showPopUp: Bool?, error: String?, errorCode: String?)  -> Void in
            
            if let error = error {
                completion(false,errorCode,nil,error)
                
                return
            }
            
            DispatchQueue.main.async {
                
                do {
                    let decoder = JSONDecoder()
                    if result == nil {
                        completion(false,errorCode,nil,"Unhandled Error")
                        return
                    }
                    let values = try decoder.decode(BaseResponse<LoginModel>.self, from: result!)
                    completion(true,errorCode,values as AnyObject?,error)
                    
                } catch let error as NSError {
                    //do something with error
                    completion(false,errorCode,nil,error.localizedDescription)
                }
                
            }
        }
        )
    }
    
    
}

class ApiManager {
    static let shared  = ApiManager()
    
    init() {
        
    }
    
    func fetchData(url: String, completion: @escaping (Result<BaseResponse<LoginModel>, Error>)->Void) {
        let url = URL(string: "www.google.com")!
        
        URLSession.shared.dataTask(with: url) { (data, res, error) in
            if let dataItem = data {
                do {
                    let response = try JSONDecoder().decode(BaseResponse<LoginModel>.self, from: dataItem)
                    completion(.success(response))
                } catch {
                    completion(.failure(NSError()))
                }
            }
        }
    }
}
