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
    
    init(apiServices: CartApiServiceProtocol = CartApiService()) {
        self.apiServices = apiServices
    }
    
    func getCart() {
        if Reachability.isConnectedToNetwork() {
         //   self.showLoadingIndicatorClosure?()
            let deviceId = UIDevice.current.identifierForVendor!.uuidString

            self.apiServices?.getCart(finalURL: "\(CommonConfig.url.finalURL)/get_cart?device_id=\(deviceId)", withParameters: "", completion: { (status: Bool? , errorCode: String?,result: AnyObject?, errorMessage: String?) -> Void in
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
    
    func removeCart(id: String) {
        if Reachability.isConnectedToNetwork() {
            self.showLoadingIndicatorClosure?()
            
            self.apiServices?.removeCart(finalURL: "\(CommonConfig.url.finalURL)/destroy_cart?term_id=\(id)", httpHeaders: [String:String](), withParameters: "", completion: { (status: Bool? , errorCode: String?,result: AnyObject?, errorMessage: String?) -> Void in
                DispatchQueue.main.async {
                    self.hideLoadingIndicatorClosure?()
                    if status == true {
                        let model  = result as? BaseResponse<DestroyCartModel>
                        self.destroyCartModel = model?.data
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
}
