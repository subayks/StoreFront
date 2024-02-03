//
//  ItemListViewModel.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 26/01/24.
//

import Foundation
class ItemListViewModel: BaseViewModel {
    var postsModel: Posts?
    var apiServices: HomeApiServicesProtocol?
    var productDetailsModel: ProductDetailsModel?
    var productsModel: ProductsModel?

    var title: String?
    var index: Int = 0
    var brandArray = ["Puma", "Adidas", "Polo", "LP"]
    var sortArray = ["Low to High", "High to Low", "Discount"]
    var filterArray = ["Men", "Women", "Kids"]
    var selectedType: String?
    
    init(apiServices: HomeApiServicesProtocol = HomeApiService()) {
        self.apiServices = apiServices
    }
    
    init(postsModel: Posts, title: String, selectedType: String = "", index: Int = 0,apiServices: HomeApiServicesProtocol = HomeApiService()) {
        self.postsModel = postsModel
        self.title = title
        self.index = index
        self.selectedType = selectedType
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
    
    func getProductsList() {
        if Reachability.isConnectedToNetwork() {
            self.showLoadingIndicatorClosure?()
            
            self.apiServices?.getProductsList(finalURL: "\(CommonConfig.url.finalURL)/product", withParameters: "", completion: { (status: Bool? , errorCode: String?,result: AnyObject?, errorMessage: String?) -> Void in
                DispatchQueue.main.async {
                    self.hideLoadingIndicatorClosure?()
                    if status == true {
                        let model  = result as? BaseResponse<ProductsModel>
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
    
    func sortList()->[PostsItem] {
        if index == 1 || selectedType == "men" {
            return self.postsModel?.data?.filter{$0.categories!.contains(where: { $0.slug?.lowercased() == "men" }) && $0.stock?.stockQty ?? 0 > 0} ?? [PostsItem]()
        } else if index == 2  || selectedType == "women" {
            return self.postsModel?.data?.filter{$0.categories!.contains(where: { $0.slug?.lowercased() == "women" }) && $0.stock?.stockQty ?? 0 > 0} ?? [PostsItem]()
        } else if index == 3 || selectedType == "kids" {
            return self.postsModel?.data?.filter{$0.categories!.contains(where: { $0.slug?.lowercased() == "kids" }) && $0.stock?.stockQty ?? 0 > 0} ?? [PostsItem]()
        } else {
            return self.postsModel?.data?.filter{$0.stock?.stockQty ?? 0 > 0} ?? [PostsItem]()
        }
    }
    
    func getnumberOfRows() ->Int {
        return self.sortList().count
    }
    
    func getCategoryCollectionViewCell(index: Int) ->CategoryCollectionViewCellVM {
        return CategoryCollectionViewCellVM(dressCellObject: self.sortList()[index], title: "")
    }
    
    func getItemDetailViewModel() ->ItemDetailViewModel {
        return ItemDetailViewModel(productDetails: self.productDetailsModel ?? ProductDetailsModel())
    }
}
