//
//  ItemDetailViewModel.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 26/01/24.
//

import Foundation
import UIKit
class ItemDetailViewModel: BaseViewModel {
    var apiServices: HomeApiServicesProtocol?
    var productDetailsModel: ProductDetailsModel?
    var wishListResponseModel: WishListeResponseModel?
    var addItemModel: AddItemModel?
    
    var title: String?
    var reloadHeartImage:(()->())?
    var isFromWishList: Bool?
    var count = 0

    init(productDetails: ProductDetailsModel, apiServices: HomeApiServicesProtocol = HomeApiService(), isFromWishList: Bool = false) {
        self.productDetailsModel = productDetails
        self.title = productDetails.info?.title
        self.apiServices = apiServices
        self.isFromWishList = isFromWishList
    }
    
    init(apiServices: HomeApiServicesProtocol = HomeApiService()) {
        self.apiServices = apiServices
    }
    
    func getProductDetails(id: String) {
        if Reachability.isConnectedToNetwork() {
            self.showLoadingIndicatorClosure?()
            let deviceId = UIDevice.current.identifierForVendor!.uuidString

            self.apiServices?.getProductsDetails(finalURL: "\(CommonConfig.url.finalURL)/get_product_detail?id=\(id)&device_id=\(deviceId)", withParameters: "", completion: { (status: Bool? , errorCode: String?,result: AnyObject?, errorMessage: String?) -> Void in
                DispatchQueue.main.async {
                    self.hideLoadingIndicatorClosure?()
                    if status == true {
                        let model  = result as? BaseResponse<ProductDetailsModel>
                        self.productDetailsModel = model?.data
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
    
    func addToWishList(id: String) {
        if Reachability.isConnectedToNetwork() {
            self.showLoadingIndicatorClosure?()
            let email = (UserDefaults.standard.string(forKey: "email") ?? "")
            let param =  self.getWishListParam()
            self.apiServices?.addToWishList(finalURL: "\(CommonConfig.url.finalURL)/add_to_wishlist", httpHeaders: [String:String](), withParameters: param, completion: { (status: Bool? , errorCode: String?,result: AnyObject?, errorMessage: String?) -> Void in
                DispatchQueue.main.async {
                    self.hideLoadingIndicatorClosure?()
                    if status == true {
                        let model  = result as? BaseResponse<WishListeResponseModel>
                        self.wishListResponseModel = model?.data
                        self.reloadHeartImage?()
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
        let deviceId = UIDevice.current.identifierForVendor!.uuidString

        let jsonToReturn: NSDictionary = ["term_id": "\(self.productDetailsModel?.info?.id ?? 0)",
                                          "qty": "1","device_id": deviceId]
    return self.convertDictionaryToJsonString(dict: jsonToReturn)!
    }
    
    func removeWishList(id: String) {
        if Reachability.isConnectedToNetwork() {
            self.showLoadingIndicatorClosure?()
            var postParam = self.removeWishListParam(id: id)
            self.apiServices?.removeWishList(finalURL: "\(CommonConfig.url.finalURL)/remove_wishlist", httpHeaders: [String:String](), withParameters: postParam, completion: { (status: Bool? , errorCode: String?,result: AnyObject?, errorMessage: String?) -> Void in
                DispatchQueue.main.async {
                    self.hideLoadingIndicatorClosure?()
                    if status == true {
                        let model  = result as? BaseResponse<WishListeResponseModel>
                        self.wishListResponseModel = model?.data
                        self.reloadHeartImage?()
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
    
    func removeWishListParam(id: String) ->String {
        let deviceId = UIDevice.current.identifierForVendor!.uuidString

        let jsonToReturn: NSDictionary = ["id": id]
    return self.convertDictionaryToJsonString(dict: jsonToReturn)!
    }
    
    func makeOrder() {
        if Reachability.isConnectedToNetwork() {
            self.showLoadingIndicatorClosure?()
            
            let param =  self.getCartParam()
            
            self.apiServices?.addItemToCart(finalURL: "\(CommonConfig.url.finalURL)/add_to_cart", httpHeaders: [String:String](), withParameters: param, completion: { (status: Bool? , errorCode: String?,result: AnyObject?, errorMessage: String?) -> Void in
                DispatchQueue.main.async {
                    self.hideLoadingIndicatorClosure?()
                    if status == true  {
                        let model  = result as? BaseResponse<AddItemModel>
                        self.addItemModel = model?.data
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
    
    func getCartParam() ->String {
        let deviceId = UIDevice.current.identifierForVendor!.uuidString

        let jsonToReturn: NSDictionary = ["term_id": "\(self.productDetailsModel?.info?.id ?? 0)",
                                          "qty": "\(count)","device_id": deviceId]
    return self.convertDictionaryToJsonString(dict: jsonToReturn)!
    }
    
    func getMensCollectionList() ->CategoryTableViewCellVM {
        return CategoryTableViewCellVM(dressCellObject: self.makeMoreSection(), title: "You may also like")
    }
    
    func makeMoreSection() ->[PostsItem] {
        return [self.productDetailsModel?.previous ?? PostsItem(),  self.productDetailsModel?.next ?? PostsItem()]
    }
    
    func getItemDetailViewModel() ->ItemDetailViewModel {
        return ItemDetailViewModel(productDetails: self.productDetailsModel ?? ProductDetailsModel())
    }
    
    func getItemImageTableViewCellVM() ->ItemImageTableViewCellVM {
        var image = ""
        if self.productDetailsModel?.info?.medias?.count ?? 0 > 0 {
            image = self.productDetailsModel?.info?.medias?[0].url ?? ""
        } else {
            image = self.productDetailsModel?.info?.preview?.url ?? ""
        }
        return ItemImageTableViewCellVM(ordersInfo: ItemImageObject(itemDesc: "No Desc from Api",ratingCount: "0", itemName: ("₹\(self.productDetailsModel?.info?.price?.price ?? 0)"), itemImage: image))
    }
}
