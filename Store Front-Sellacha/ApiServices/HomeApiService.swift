//
//  HomeApiService.swift
//  SellAcha
//
//  Created by Subaykala on 20/10/23.
//

import Foundation
protocol HomeApiServicesProtocol {
    func getStaticData(finalURL: String, withParameters: String, completion: @escaping(_ status: Bool?, _ code: String?, _ response: AnyObject?, _ error: String?)-> Void)
}

class HomeApiService: HomeApiServicesProtocol {
    func getStaticData(finalURL: String, withParameters: String, completion: @escaping (Bool?, String?, AnyObject?, String?) -> Void) {
        let headers = [
            "Authorization": "\(((UserDefaults.standard.string(forKey: "AuthToken") ?? "") as String))",
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
//                    let values = try decoder.decode(BaseResponse<StaticData>.self, from: result!)
//                    completion(true,errorCode,values as AnyObject?,error)
                    
                } catch let error as NSError {
                    //do something with error
                    completion(false,errorCode,nil,error.localizedDescription)
                }
                
            }
        }
        )
    }
    
  
}
