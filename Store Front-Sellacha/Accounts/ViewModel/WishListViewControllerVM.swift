//
//  WishListViewControllerVM.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 15/01/24.
//

import Foundation
import UIKit
class WishListViewControllerVM: BaseViewModel {
    var dressArray: [WishListItems]?
    var productDetailsModel: ProductDetailsModel?
    var apiServices: HomeApiServicesProtocol?

    init(apiServices: HomeApiServicesProtocol = HomeApiService()) {
        self.apiServices = apiServices
    }
    
    init(dressArray: [WishListItems], apiServices: HomeApiServicesProtocol = HomeApiService()) {
        self.dressArray = dressArray
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
    
    func getnumberOfRows() ->Int {
        return dressArray?.count ?? 0
    }
    
    func getCategoryCollectionViewCell(index: Int) ->CategoryCollectionViewCellVM {
        return CategoryCollectionViewCellVM(dressCellObject: createPostItem(index: index), title: "")
    }
    
    func createPostItem(index: Int) ->PostsItem {
        let wishLitItem = dressArray?[index]
        var postItem = PostsItem()
        postItem.id = wishLitItem?.id
        var previewItem = PreviewImageModel()
        previewItem.url = wishLitItem?.preview
        postItem.preview = previewItem.pivot
        return postItem
    }
    
    func getItemDetailViewModel() ->ItemDetailViewModel {
        return ItemDetailViewModel(productDetails: self.productDetailsModel ?? ProductDetailsModel(), isFromWishList: true)
    }
}
