//
//  HomeViewModel.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 05/01/24.
//

import Foundation

class HomeViewModel: BaseViewModel {
    var apiServices: HomeApiServicesProtocol?
    var sliderModel: SliderModel?
    var productsModel: ProductsModel?
    var productDetailsModel: ProductDetailsModel?
    var reloadSliderCollectionView:(()->())?
    var titles = ["Men's Fashion", "Women's Fashion", "Kid's Fashion", "Special Deal"]
    init(apiServices: HomeApiServicesProtocol = HomeApiService()) {
        self.apiServices = apiServices
    }
    
    func getSliderInfo() {
        if Reachability.isConnectedToNetwork() {
            self.showLoadingIndicatorClosure?()
            
            self.apiServices?.getSliderData(finalURL: "\(CommonConfig.url.finalURL)/get_slider", withParameters: "", completion: { (status: Bool? , errorCode: String?,result: AnyObject?, errorMessage: String?) -> Void in
                DispatchQueue.main.async {
                    self.hideLoadingIndicatorClosure?()
                    if status == true {
                        let model  = result as? BaseResponse<SliderModel>
                        self.sliderModel = model?.data
                        self.getProductsList()

                      //  self.reloadSliderCollectionView?()
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
         //   self.showLoadingIndicatorClosure?()
            
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
    
    func getWelcomeTableViewCellVM() ->WelcomeTableViewCellVM {
        return WelcomeTableViewCellVM(posts: self.sliderModel?.posts ?? [SliderPost]())
    }
    
    func getCategoryTableViewCellVM(index: Int) ->CategoryTableViewCellVM {
        return CategoryTableViewCellVM(dressCellObject: self.sortList(index: index), title: titles[index-1])
    }
    
    func getItemListViewModel(index: Int) ->ItemListViewModel {
        return ItemListViewModel(postsModel: self.productsModel?.posts ?? Posts(),title: titles[index-1], index: index)
    }
    
    func sortList(index: Int)->[PostsItem] {
        if index == 1 {
            return self.productsModel?.posts?.data?.filter{$0.categories!.contains(where: { $0.slug?.lowercased() == "men" }) && $0.stock?.stockQty ?? 0 > 0} ?? [PostsItem]()
        } else if index == 2 {
            return self.productsModel?.posts?.data?.filter{$0.categories!.contains(where: { $0.slug?.lowercased() == "women" }) && $0.stock?.stockQty ?? 0 > 0} ?? [PostsItem]()
        } else if index == 3 {
            return self.productsModel?.posts?.data?.filter{$0.categories!.contains(where: { $0.slug?.lowercased() == "kids" }) && $0.stock?.stockQty ?? 0 > 0} ?? [PostsItem]()
        } else {
            return self.productsModel?.posts?.data?.filter{$0.stock?.stockQty ?? 0 > 0} ?? [PostsItem]()
        }
    }
    
    func getItemDetailViewModel() ->ItemDetailViewModel {
        return ItemDetailViewModel(productDetails: self.productDetailsModel ?? ProductDetailsModel())
    }
    
}
