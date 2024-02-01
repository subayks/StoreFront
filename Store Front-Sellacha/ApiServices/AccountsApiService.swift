//
//  AccountsApiService.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 31/01/24.
//

import Foundation
protocol AccountsApiServiceProtocol {
    func getWishList(finalURL: String, withParameters: String, completion: @escaping(_ status: Bool?, _ code: String?, _ response: AnyObject?, _ error: String?)-> Void)
    func removeWishList(finalURL: String, httpHeaders: [String: String], withParameters: String, completion: @escaping(_ status: Bool?, _ code: String?, _ response: AnyObject?, _ error: String?)-> Void)
    func getAddress(finalURL: String, withParameters: String, completion: @escaping(_ status: Bool?, _ code: String?, _ response: AnyObject?, _ error: String?)-> Void)
    func getOrders(finalURL: String, withParameters: String, completion: @escaping(_ status: Bool?, _ code: String?, _ response: AnyObject?, _ error: String?)-> Void)
}

class AccountsApiService: AccountsApiServiceProtocol {
    func getOrders(finalURL: String, withParameters: String, completion: @escaping (Bool?, String?, AnyObject?, String?) -> Void) {
//        let headers = [
//            "Authorization": "\(((UserDefaults.standard.string(forKey: "AuthToken") ?? "") as String))",
//        ]
        
                let headers = [
                    "Authorization": "Bearer 1469|yeMIF3WMX41EcKCE4nSucFB6p015P6r4VLrFH8cM",
                ]
        
        NetworkAdapter.clientNetworkRequestCodable(withBaseURL: finalURL, withParameters: "", withHttpMethod: "POST", withContentType: "Application/json", withHeaders: headers, completionHandler: { (result: Data?, showPopUp: Bool?, error: String?, errorCode: String?)  -> Void in
            
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
                    let values = try decoder.decode(BaseResponse<WishListModel>.self, from: result!)
                    completion(true,errorCode,values as AnyObject?,error)
                    
                } catch let error as NSError {
                    //do something with error
                    completion(false,errorCode,nil,error.localizedDescription)
                }
                
            }
        }
        )
    }
    
    func getAddress(finalURL: String, withParameters: String, completion: @escaping (Bool?, String?, AnyObject?, String?) -> Void) {
        let headers = [
            "Authorization": "\(((UserDefaults.standard.string(forKey: "AuthToken") ?? "") as String))",
        ]
        
        //        let headers = [
        //            "Authorization": "Bearer 1465|uY3O2qgAAOn0Fu4VIx58vXN8ORp4J8XeKYNsldKB",
        //        ]
        
        NetworkAdapter.clientNetworkRequestCodable(withBaseURL: finalURL, withParameters:   "", withHttpMethod: "POST", withContentType: "Application/json", withHeaders: headers, completionHandler: { (result: Data?, showPopUp: Bool?, error: String?, errorCode: String?)  -> Void in
            
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
                    let values = try decoder.decode(BaseResponse<WishListModel>.self, from: result!)
                    completion(true,errorCode,values as AnyObject?,error)
                    
                } catch let error as NSError {
                    //do something with error
                    completion(false,errorCode,nil,error.localizedDescription)
                }
                
            }
        }
        )
    }
    
    func removeWishList(finalURL: String, httpHeaders: [String : String], withParameters: String, completion: @escaping (Bool?, String?, AnyObject?, String?) -> Void) {
        //        let headers = [
        //            "Authorization": "\(((UserDefaults.standard.string(forKey: "AuthToken") ?? "") as String))",
        //            ]
                let headers = [
                    "Authorization": "Bearer 1465|uY3O2qgAAOn0Fu4VIx58vXN8ORp4J8XeKYNsldKB",
                ]
                NetworkAdapter.clientNetworkRequestCodable(withBaseURL: finalURL, withParameters:  withParameters, withHttpMethod: "POST", withContentType: "Application/json", withHeaders: headers, completionHandler: { (result: Data?, showPopUp: Bool?, error: String?, errorCode: String?)  -> Void in
                    
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
                            let values = try decoder.decode(BaseResponse<WishListeResponseModel>.self, from: result!)
                            completion(true,errorCode,values as AnyObject?,error)
                            
                        } catch let error as NSError {
                            //do something with error
                            completion(false,errorCode,nil,error.localizedDescription)
                        }
                        
                    }
                }
                )
            }
    
    func getWishList(finalURL: String, withParameters: String, completion: @escaping (Bool?, String?, AnyObject?, String?) -> Void) {
        let headers = [
            "Authorization": "\(((UserDefaults.standard.string(forKey: "AuthToken") ?? "") as String))",
        ]
        
        //        let headers = [
        //            "Authorization": "Bearer 1465|uY3O2qgAAOn0Fu4VIx58vXN8ORp4J8XeKYNsldKB",
        //        ]
        
        NetworkAdapter.clientNetworkRequestCodable(withBaseURL: finalURL, withParameters:   "", withHttpMethod: "POST", withContentType: "Application/json", withHeaders: headers, completionHandler: { (result: Data?, showPopUp: Bool?, error: String?, errorCode: String?)  -> Void in
            
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
                    let values = try decoder.decode(BaseResponse<WishListModel>.self, from: result!)
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
