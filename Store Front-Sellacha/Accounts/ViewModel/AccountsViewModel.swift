//
//  AccountsViewModel.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 07/01/24.
//

import Foundation
import Photos
import UIKit

class AccountsViewModel: BaseViewModel {
    var apiServices: AccountsApiServiceProtocol?
    var wishListModel: WishListModel?
    var productDetailsModel: ProductDetailsModel?
    var ordersModel: OrdersModel?
    var userInfoModel: UserInfoModel?
    var navigationToWishListClosure:(()->())?
    var navigationToOrdersClosure:(()->())?
    var navigationToUserInfoClosure:(()->())?

    init(apiServices: AccountsApiServiceProtocol = AccountsApiService()) {
        self.apiServices = apiServices
    }
    
    func getWishList() {
        if Reachability.isConnectedToNetwork() {
            self.showLoadingIndicatorClosure?()
            let param = getWishListParam()
            self.apiServices?.getWishList(finalURL: "\(CommonConfig.url.finalURL)/get_wishlistsa", withParameters: param, completion: { (status: Bool? , errorCode: String?,result: AnyObject?, errorMessage: String?) -> Void in
                DispatchQueue.main.async {
                    self.hideLoadingIndicatorClosure?()
                    if status == true {
                        let model  = result as? BaseResponse<WishListModel>
                        self.wishListModel = model?.data
                        self.navigationToWishListClosure?()
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
    
    func getWishListParam() ->String {

        let jsonToReturn: NSDictionary = ["device_id": "535345345354"]
    return self.convertDictionaryToJsonString(dict: jsonToReturn)!
    }
    
    func gerOrdersList() {
        if Reachability.isConnectedToNetwork() {
            self.showLoadingIndicatorClosure?()
            let param = getOrdersParam()
            self.apiServices?.getOrders(finalURL: "\(CommonConfig.url.finalURL)/uorders?email=alauddinansari7379@gmail.com", withParameters: param, completion: { (status: Bool? , errorCode: String?,result: AnyObject?, errorMessage: String?) -> Void in
                DispatchQueue.main.async {
                    self.hideLoadingIndicatorClosure?()
                    if status == true {
                        let model  = result as? BaseResponse<OrdersModel>
                        self.ordersModel = model?.data
                        self.navigationToOrdersClosure?()
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
    
    func getOrdersParam() ->String {

        let jsonToReturn: NSDictionary = ["email": "mynewgmail@gmail.com", "type": "all"]
    return self.convertDictionaryToJsonString(dict: jsonToReturn)!
    }
    
    func getUserInfo() {
        if Reachability.isConnectedToNetwork() {
            self.showLoadingIndicatorClosure?()
            let email = (UserDefaults.standard.string(forKey: "email") ?? "")
            self.apiServices?.getAddress(finalURL: "\(CommonConfig.url.finalURL)/usettings?email=\(email)", withParameters: "", completion: { (status: Bool? , errorCode: String?,result: AnyObject?, errorMessage: String?) -> Void in
                DispatchQueue.main.async {
                    self.hideLoadingIndicatorClosure?()
                    if status == true {
                        let model  = result as? BaseResponse<UserInfoModel>
                        self.userInfoModel = model?.data
                        self.navigationToUserInfoClosure?()
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
    
    func getWishListViewControllerVM() ->WishListViewControllerVM {
        return WishListViewControllerVM(dressArray: self.wishListModel?.items ?? [WishListItems]())
    }
    
    func getOrdersViewControllerVM() ->OrdersViewControllerVM {
        return OrdersViewControllerVM(ordersModel: self.ordersModel ?? OrdersModel())
    }
    
    func getSettingsViewControllerVM() ->SettingsViewControllerVM {
        return SettingsViewControllerVM(userInfoModel: self.userInfoModel ?? UserInfoModel())
    }
}
