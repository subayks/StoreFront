//
//  ItemSearchViewModel.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 26/01/24.
//

import Foundation
import UIKit
class ItemSearchViewModel: BaseViewModel {
    var apiServices: HomeApiServicesProtocol?
    var productsModel: SearchModel?
    var productDetailsModel: ProductDetailsModel?

    init(apiServices: HomeApiServicesProtocol = HomeApiService()) {
        self.apiServices = apiServices
    }
    
    func getSearchList(title: String) {
        if Reachability.isConnectedToNetwork() {
            self.showLoadingIndicatorClosure?()
            
            self.apiServices?.searchproduct(finalURL: "\(CommonConfig.url.finalURL)/all_product?type=product&term=\(title)", httpHeaders: [String:String](), withParameters: "", completion: { (status: Bool? , errorCode: String?,result: AnyObject?, errorMessage: String?) -> Void in
                DispatchQueue.main.async {
                    self.hideLoadingIndicatorClosure?()
                    if status == true {
                        let model  = result as? BaseResponse<SearchModel>
                        self.productsModel = model?.data
                        self.reloadCollectionView?()
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
    
    func getCategoryCollectionViewCell(index: Int) ->CategoryCollectionViewCellVM {
        return CategoryCollectionViewCellVM(dressCellObject: self.productsModel?.data?[index] ?? PostsItem(), title: "")
    }
    
    func getItemDetailViewModel() ->ItemDetailViewModel {
        return ItemDetailViewModel(productDetails: self.productDetailsModel ?? ProductDetailsModel())
    }
}
