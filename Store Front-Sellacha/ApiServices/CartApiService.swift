//
//  CartApiService.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 31/01/24.
//

import Foundation
protocol CartApiServiceProtocol {
    func getCart(finalURL: String, withParameters: String, completion: @escaping(_ status: Bool?, _ code: String?, _ response: AnyObject?, _ error: String?)-> Void)
    func removeCart(finalURL: String, httpHeaders: [String: String], withParameters: String, completion: @escaping(_ status: Bool?, _ code: String?, _ response: AnyObject?, _ error: String?)-> Void)
    func makeOrder(finalURL: String, httpHeaders: [String: String], withParameters: String, completion: @escaping(_ status: Bool?, _ code: String?, _ response: AnyObject?, _ error: String?)-> Void)
    func getOrders(finalURL: String, withParameters: String, completion: @escaping(_ status: Bool?, _ code: String?, _ response: AnyObject?, _ error: String?)-> Void)
    func getUserInfo(finalURL: String, withParameters: String, completion: @escaping(_ status: Bool?, _ code: String?, _ response: AnyObject?, _ error: String?)-> Void)
    func updateUserInfo(finalURL: String, httpHeaders: [String: String], withParameters: String, completion: @escaping(_ status: Bool?, _ code: String?, _ response: AnyObject?, _ error: String?)-> Void)
    func deleteAccount(finalURL: String, httpHeaders: [String: String], withParameters: String, completion: @escaping(_ status: Bool?, _ code: String?, _ response: AnyObject?, _ error: String?)-> Void)
    func addItemToCart(finalURL: String, httpHeaders: [String: String], withParameters: String, completion: @escaping(_ status: Bool?, _ code: String?, _ response: AnyObject?, _ error: String?)-> Void)
    func destroyCart(finalURL: String, httpHeaders: [String: String], withParameters: String, completion: @escaping(_ status: Bool?, _ code: String?, _ response: AnyObject?, _ error: String?)-> Void)
}

class CartApiService: CartApiServiceProtocol {
    func destroyCart(finalURL: String, httpHeaders: [String : String], withParameters: String, completion: @escaping (Bool?, String?, AnyObject?, String?) -> Void) {
        let headers = [
            "Authorization": "Bearer 1469|yeMIF3WMX41EcKCE4nSucFB6p015P6r4VLrFH8cM",
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
                    let values = try decoder.decode(DestroyCartModel.self, from: result!)
                    completion(true,errorCode,values as AnyObject?,error)
                    
                } catch let error as NSError {
                    //do something with error
                    completion(false,errorCode,nil,error.localizedDescription)
                }
                
            }
        }
        )
    }
    
    func addItemToCart(finalURL: String, httpHeaders: [String : String], withParameters: String, completion: @escaping (Bool?, String?, AnyObject?, String?) -> Void) {
        let headers = [
            "Authorization": "Bearer 1469|yeMIF3WMX41EcKCE4nSucFB6p015P6r4VLrFH8cM",
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
                    let values = try decoder.decode(BaseResponse<AddItemModel>.self, from: result!)
                    completion(true,errorCode,values as AnyObject?,error)
                    
                } catch let error as NSError {
                    //do something with error
                    completion(false,errorCode,nil,error.localizedDescription)
                }
                
            }
        }
        )
    }
    
    func deleteAccount(finalURL: String, httpHeaders: [String : String], withParameters: String, completion: @escaping (Bool?, String?, AnyObject?, String?) -> Void) {
        let headers = [
                   "Authorization": "\(((UserDefaults.standard.string(forKey: "AuthToken") ?? "") as String))",
                   ]
       
//           let headers = [
//               "Authorization": "Bearer 1469|yeMIF3WMX41EcKCE4nSucFB6p015P6r4VLrFH8cM",
//           ]
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
                    let values = try decoder.decode(DestroyCartModel.self, from: result!)
                    completion(true,errorCode,values as AnyObject?,error)
                    
                } catch let error as NSError {
                    //do something with error
                    completion(false,errorCode,nil,error.localizedDescription)
                }
                
            }
        }
        )
    }
    
    func updateUserInfo(finalURL: String, httpHeaders: [String : String], withParameters: String, completion: @escaping (Bool?, String?, AnyObject?, String?) -> Void) {
           let headers = [
                      "Authorization": "\(((UserDefaults.standard.string(forKey: "AuthToken") ?? "") as String))",
                      ]
          
//           let headers = [
//               "Authorization": "Bearer 1469|yeMIF3WMX41EcKCE4nSucFB6p015P6r4VLrFH8cM",
//           ]
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
                       let values = try decoder.decode(DestroyCartModel.self, from: result!)
                       completion(true,errorCode,values as AnyObject?,error)
                       
                   } catch let error as NSError {
                       //do something with error
                       completion(false,errorCode,nil,error.localizedDescription)
                   }
                   
               }
           }
           )
       }
    
    func getUserInfo(finalURL: String, withParameters: String, completion: @escaping (Bool?, String?, AnyObject?, String?) -> Void) {
                let headers = [
                    "Authorization": "\(((UserDefaults.standard.string(forKey: "AuthToken") ?? "") as String))",
                    ]
        
//        let headers = [
//            "Authorization": "Bearer 1469|yeMIF3WMX41EcKCE4nSucFB6p015P6r4VLrFH8cM",
//        ]
        
        NetworkAdapter.clientNetworkRequestCodable(withBaseURL: finalURL, withParameters:   "", withHttpMethod: "GET", withContentType: "Application/json", withHeaders: headers, completionHandler: { (result: Data?, showPopUp: Bool?, error: String?, errorCode: String?)  -> Void in
            
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
                    let values = try decoder.decode(BaseResponse<UserInfoModel>.self, from: result!)
                    completion(true,errorCode,values as AnyObject?,error)
                    
                } catch let error as NSError {
                    //do something with error
                    completion(false,errorCode,nil,error.localizedDescription)
                }
                
            }
        }
        )
    }
    
    func getOrders(finalURL: String, withParameters: String, completion: @escaping (Bool?, String?, AnyObject?, String?) -> Void) {
        //        let headers = [
        //            "Authorization": "\(((UserDefaults.standard.string(forKey: "AuthToken") ?? "") as String))",
        //            ]
        
        let headers = [
            "Authorization": "Bearer 1469|yeMIF3WMX41EcKCE4nSucFB6p015P6r4VLrFH8cM",
        ]
        
        NetworkAdapter.clientNetworkRequestCodable(withBaseURL: finalURL, withParameters:   "", withHttpMethod: "GET", withContentType: "Application/json", withHeaders: headers, completionHandler: { (result: Data?, showPopUp: Bool?, error: String?, errorCode: String?)  -> Void in
            
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
                    let values = try decoder.decode(BaseResponse<OrdersModel>.self, from: result!)
                    completion(true,errorCode,values as AnyObject?,error)
                    
                } catch let error as NSError {
                    //do something with error
                    completion(false,errorCode,nil,error.localizedDescription)
                }
                
            }
        }
        )
    }
    
    func makeOrder(finalURL: String, httpHeaders: [String : String], withParameters: String, completion: @escaping (Bool?, String?, AnyObject?, String?) -> Void) {
     //   let headers = [
       //            "Authorization": "\(((UserDefaults.standard.string(forKey: "AuthToken") ?? "") as String))",
       //            ]
       
        let headers = [
            "Authorization": "Bearer 1469|yeMIF3WMX41EcKCE4nSucFB6p015P6r4VLrFH8cM",
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
                    let values = try decoder.decode(DestroyCartModel.self, from: result!)
                    completion(true,errorCode,values as AnyObject?,error)
                    
                } catch let error as NSError {
                    //do something with error
                    completion(false,errorCode,nil,error.localizedDescription)
                }
                
            }
        }
        )
    }
    
    func removeCart(finalURL: String, httpHeaders: [String : String], withParameters: String, completion: @escaping (Bool?, String?, AnyObject?, String?) -> Void) {
        let headers = [
            "Authorization": "Bearer 1469|yeMIF3WMX41EcKCE4nSucFB6p015P6r4VLrFH8cM",
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
                    let values = try decoder.decode(DestroyCartModel.self, from: result!)
                    completion(true,errorCode,values as AnyObject?,error)
                    
                } catch let error as NSError {
                    //do something with error
                    completion(false,errorCode,nil,error.localizedDescription)
                }
                
            }
        }
        )
    }
    
    func getCart(finalURL: String, withParameters: String, completion: @escaping (Bool?, String?, AnyObject?, String?) -> Void) {
        //        let headers = [
        //            "Authorization": "\(((UserDefaults.standard.string(forKey: "AuthToken") ?? "") as String))",
        //            ]
        
        let headers = [
            "Authorization": "Bearer 1465|uY3O2qgAAOn0Fu4VIx58vXN8ORp4J8XeKYNsldKB",
        ]
        
        NetworkAdapter.clientNetworkRequestCodable(withBaseURL: finalURL, withParameters:   "", withHttpMethod: "GET", withContentType: "Application/json", withHeaders: headers, completionHandler: { (result: Data?, showPopUp: Bool?, error: String?, errorCode: String?)  -> Void in
            
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
                    let values = try decoder.decode(BaseResponse<CartModel>.self, from: result!)
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
