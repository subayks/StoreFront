//
//  CategoriesViewModel.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 05/01/24.
//

import Foundation
class CategoriesViewModel: BaseViewModel {
    var apiServices: HomeApiServicesProtocol?
    var selectedType: String?
    var title: String?
    var categoryModel: CategoryModel?
    var categoryClosure:(()->())?
    var searchModel: SearchModel?
    
    init(apiServices: HomeApiServicesProtocol = HomeApiService()) {
        self.apiServices = apiServices
    }
    
    func getCategoryList() {
        if Reachability.isConnectedToNetwork() {
            self.showLoadingIndicatorClosure?()
            
            self.apiServices?.getCategoryList(finalURL: "\(CommonConfig.url.finalURL)/get_category?type=category", httpHeaders: [String:String](), withParameters: "", completion: { (status: Bool? , errorCode: String?,result: AnyObject?, errorMessage: String?) -> Void in
                DispatchQueue.main.async {
                    self.hideLoadingIndicatorClosure?()
                    if status == true {
                        let model  = result as? BaseResponse<CategoryModel>
                        self.categoryModel = model?.data
                        self.categoryClosure?()
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
    
    func getCategorySearch(index: Int) {
        if Reachability.isConnectedToNetwork() {
            self.showLoadingIndicatorClosure?()
            let searchTitle = self.categoryModel?.data?[index].id
            self.apiServices?.searchproduct(finalURL: "\(CommonConfig.url.finalURL)/all_product?categories=\(searchTitle ?? 0)&type=product", httpHeaders: [String:String](), withParameters: "", completion: { (status: Bool? , errorCode: String?,result: AnyObject?, errorMessage: String?) -> Void in
                DispatchQueue.main.async {
                    self.hideLoadingIndicatorClosure?()
                    if status == true {
                        let model  = result as? BaseResponse<SearchModel>
                        self.searchModel = model?.data
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
    
    func getItemListViewModel() ->ItemListViewModel {
        return ItemListViewModel(postsModel: self.searchModel?.data ?? [PostsItem](), title: title ?? "", selectedType: selectedType ?? "")
    }
    
    func getCategoriesListCollectionViewCellVM(index: Int) ->CategoriesListCollectionViewCellVM {
        return CategoriesListCollectionViewCellVM(categoryData: self.categoryModel?.data?[index] ?? CategoryData())
    }
    
}
