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
    var title: String?
    var reloadHeartImage:(()->())?
    var isFromWishList: Bool?
    
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
            
            self.apiServices?.getProductsDetails(finalURL: "\(CommonConfig.url.finalURL)/get_pro_detail?id=\(id)", withParameters: "", completion: { (status: Bool? , errorCode: String?,result: AnyObject?, errorMessage: String?) -> Void in
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
            let deviceId = UIDevice.current.identifierForVendor!.uuidString
            
            self.apiServices?.addToWishList(finalURL: "\(CommonConfig.url.finalURL)/add_to_wishlist?email=\(email)&term_id=\(id)&device_id=\(deviceId)", httpHeaders: [String:String](), withParameters: "", completion: { (status: Bool? , errorCode: String?,result: AnyObject?, errorMessage: String?) -> Void in
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
    
    func removeWishList(id: String) {
        if Reachability.isConnectedToNetwork() {
            self.showLoadingIndicatorClosure?()
            
            self.apiServices?.removeWishList(finalURL: "\(CommonConfig.url.finalURL)/remove_wishlist?id=\(id)", httpHeaders: [String:String](), withParameters: "", completion: { (status: Bool? , errorCode: String?,result: AnyObject?, errorMessage: String?) -> Void in
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
