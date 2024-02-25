//
//  CartViewModel.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 06/01/24.
//

import Foundation
import UIKit
class CartViewModel: BaseViewModel {
    var apiServices: CartApiServiceProtocol?
    var cartModel: CartModel?
    var destroyCartModel: DestroyCartModel?
    var addItemModel: AddItemModel?
    var addtoCartModel: AddtoCartModel?
    
    init(apiServices: CartApiServiceProtocol = CartApiService()) {
        self.apiServices = apiServices
    }
    
    func getCart() {
        if Reachability.isConnectedToNetwork() {
         //   self.showLoadingIndicatorClosure?()
            let deviceId = UIDevice.current.identifierForVendor!.uuidString
            self.apiServices?.getCart(finalURL: "\(CommonConfig.url.finalURL)/get_cart?device_id=\(535345345354)", withParameters: "", completion: { (status: Bool? , errorCode: String?,result: AnyObject?, errorMessage: String?) -> Void in
                DispatchQueue.main.async {
                    self.hideLoadingIndicatorClosure?()
                    if status == true {
                        let model  = result as? BaseResponse<CartModel>
                        self.cartModel = model?.data
                        self.reloadTableView?()
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
    
//    func removeCart(id: String) {
//        if Reachability.isConnectedToNetwork() {
//            self.showLoadingIndicatorClosure?()
//            
//            self.apiServices?.removeCart(finalURL: "\(CommonConfig.url.finalURL)/destroy_cart?term_id=\(id)", httpHeaders: [String:String](), withParameters: "", completion: { (status: Bool? , errorCode: String?,result: AnyObject?, errorMessage: String?) -> Void in
//                DispatchQueue.main.async {
//                    self.hideLoadingIndicatorClosure?()
//                    if status == true {
//                        let model  = result as? BaseResponse<DestroyCartModel>
//                        self.destroyCartModel = model?.data
//                        self.getCart()
//                    }
//                    else{
//                        self.alertClosure?(errorMessage ?? "Some Technical Problem")
//                    }
//                }
//            })
//        }
//        else {
//            self.alertClosure?("No Internet Availabe")
//        }
//    }
    
    func updateCart(id: String) {
        if Reachability.isConnectedToNetwork() {
            self.showLoadingIndicatorClosure?()
            let param =  self.getCartParam(id: id)
            
            self.apiServices?.updateCart(finalURL: "\(CommonConfig.url.finalURL)/cart_remove", httpHeaders: [String:String](), withParameters: param, completion: { (status: Bool? , errorCode: String?,result: AnyObject?, errorMessage: String?) -> Void in
                DispatchQueue.main.async {
                    self.hideLoadingIndicatorClosure?()
                    if status == true {
                        let model  = result as? BaseResponse<AddItemModel>
                        self.addItemModel = model?.data
                        self.getCart()
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
    
    func addToCart(termId: String, qty: String) {
        if Reachability.isConnectedToNetwork() {
            self.showLoadingIndicatorClosure?()
            
            let param =  self.getCartParam(termId: termId, qty: qty)
            
            self.apiServices?.addItemToCart(finalURL: "\(CommonConfig.url.finalURL)/add_to_cart", httpHeaders: [String:String](), withParameters: param, completion: { (status: Bool? , errorCode: String?,result: AnyObject?, errorMessage: String?) -> Void in
                DispatchQueue.main.async {
                    self.hideLoadingIndicatorClosure?()
                    if status == true  {
                        let model  = result as? BaseResponse<AddtoCartModel>
                        self.addtoCartModel = model?.data
                        self.getCart()
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
    
    func destroyFullCart() {
        if Reachability.isConnectedToNetwork() {
            self.showLoadingIndicatorClosure?()
            
            self.apiServices?.destroyCart(finalURL: "\(CommonConfig.url.finalURL)/destroy_cart?device_id=535345345354", httpHeaders: [String:String](), withParameters: "", completion: { (status: Bool? , errorCode: String?,result: AnyObject?, errorMessage: String?) -> Void in
                DispatchQueue.main.async {
                    self.hideLoadingIndicatorClosure?()
                    if status == true  {
                        let model  = result as? DestroyCartModel
                        self.destroyCartModel = model
                        self.getCart()
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
    
    func getCartParam(termId: String, qty: String) ->String {
        let deviceId = UIDevice.current.identifierForVendor!.uuidString

        let jsonToReturn: NSDictionary = ["term_id": termId,
                                          "qty": 1,"device_id": "535345345354"]
    return self.convertDictionaryToJsonString(dict: jsonToReturn)!
    }
    
    func getCartParam(id: String) ->String {
        let deviceId = UIDevice.current.identifierForVendor!.uuidString

        let jsonToReturn: NSDictionary = ["device_id": 535345345354,"id": id]
    return self.convertDictionaryToJsonString(dict: jsonToReturn)!
    }
    
    func getCartTableViewCellVM(index: Int) ->CartTableViewCellVM {
        return CartTableViewCellVM(productInfo: self.cartModel?.items?[index] ?? CartItems())
    }
    
    func totalBill() ->String{
        var amountArray = [Int]()
        if let cartItems  = self.cartModel?.items {
            for item in cartItems {
                amountArray.append(Int(item.price ?? "") ?? 0)
            }
        }
        let total = amountArray.reduce(0, { $0 + $1 })
        return String(total)
    }
    
    func getCheckoutViewControllerVM() ->CheckoutViewControllerVM {
        return CheckoutViewControllerVM(cartModel: self.cartModel ?? CartModel())
    }
}
