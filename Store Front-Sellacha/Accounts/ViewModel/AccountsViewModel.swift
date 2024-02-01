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
    var navigationToWishListClosure:(()->())?

    init(apiServices: AccountsApiServiceProtocol = AccountsApiService()) {
        self.apiServices = apiServices
    }
    
    func getWishList() {
        if Reachability.isConnectedToNetwork() {
            self.showLoadingIndicatorClosure?()
            
            self.apiServices?.getWishList(finalURL: "\(CommonConfig.url.finalURL)/get_wishlistsa", withParameters: "", completion: { (status: Bool? , errorCode: String?,result: AnyObject?, errorMessage: String?) -> Void in
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
    
    func getWishListViewControllerVM() ->WishListViewControllerVM {
        return WishListViewControllerVM(dressArray: self.wishListModel?.items ?? [WishListItems]())
    }
}
