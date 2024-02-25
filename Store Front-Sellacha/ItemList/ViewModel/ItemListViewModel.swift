//
//  ItemListViewModel.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 26/01/24.
//

import Foundation
class ItemListViewModel: BaseViewModel {
    var postsModel: [PostsItem]?
    var originalModel: [PostsItem]?
    var apiServices: HomeApiServicesProtocol?
    var productDetailsModel: ProductDetailsModel?
    var productsModel: ProductsModel?
    var title: String?
    var index: Int = 0
    var brandArray = ["Puma", "Adidas", "Polo", "LP"]
    var sortArray = ["Low to High", "High to Low", "Relevant"]
    var selectedType: String?
    var categoryModel: CategoryModel?
    var categoryClosure:(()->())?
    var searchModel: SearchModel?
    
    init(apiServices: HomeApiServicesProtocol = HomeApiService()) {
        self.apiServices = apiServices
    }
    
    init(postsModel: [PostsItem]?, title: String, selectedType: String = "", index: Int = 0,apiServices: HomeApiServicesProtocol = HomeApiService()) {
        self.postsModel = postsModel
        self.originalModel = postsModel
        self.title = title
        self.index = index
        self.selectedType = selectedType
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
                        self.postsModel = self.searchModel?.data
                        self.originalModel = self.postsModel
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
    
//    func getProductsList() {
//        if Reachability.isConnectedToNetwork() {
//            self.showLoadingIndicatorClosure?()
//            var endPoint = "/home_page_products?latest_product=0&latest_product2=0&get_offerable_products=0&get_offerable_products2=0&trending_products2=0&best_selling_product=1&best_selling_product2=0&menu_category=0&menu_category2=0&bump_adds=0&banner_adds=0&featured_category=0&featured_category2=0&featured_brand=0&category_with_product=0&brand_with_product=0&random_product=1&trending_products=1"
//            if title == "Trending Products" {
//                endPoint = "/home_page_products?latest_product=0&latest_product2=0&get_offerable_products=0&get_offerable_products2=0&trending_products2=0&best_selling_product=0&best_selling_product2=0&menu_category=0&menu_category2=0&bump_adds=0&banner_adds=0&featured_category=0&featured_category2=0&featured_brand=0&category_with_product=0&brand_with_product=0&random_product=0&trending_products=1"
//            } else if title == "Best Selling Products" {
//                endPoint = "/home_page_products?latest_product=0&latest_product2=0&get_offerable_products=0&get_offerable_products2=0&trending_products2=0&best_selling_product=1&best_selling_product2=0&menu_category=0&menu_category2=0&bump_adds=0&banner_adds=0&featured_category=0&featured_category2=0&featured_brand=0&category_with_product=0&brand_with_product=0&random_product=1&trending_products=0"
//            } else {
//                endPoint = "/home_page_products?latest_product=0&latest_product2=0&get_offerable_products=0&get_offerable_products2=0&trending_products2=0&best_selling_product=0&best_selling_product2=0&menu_category=0&menu_category2=0&bump_adds=0&banner_adds=0&featured_category=0&featured_category2=0&featured_brand=0&category_with_product=0&brand_with_product=0&random_product=1&trending_products=0"
//            }
//            self.apiServices?.getProductsList(finalURL: "\(CommonConfig.url.finalURL)/\(endPoint)", withParameters: "", completion: { (status: Bool? , errorCode: String?,result: AnyObject?, errorMessage: String?) -> Void in
//                DispatchQueue.main.async {
//                    self.hideLoadingIndicatorClosure?()
//                    if status == true {
//                        let model  = result as? BaseResponse<ProductsModel>
//                        self.productsModel = model?.data
//                        self.reloadCollectionView?()
//                    }
//                    else{
//                        self.alertClosure?(errorMessage ?? "Some Technical Problem")
//                    }
//                }
//            })
//        }
//        else {
//            self.alertClosure?("No Internet Availabe")
//        }
//    }
    
    func getnumberOfRows() ->Int {
        return self.postsModel?.count ?? 0
    }
    
    func getCategoryCollectionViewCell(index: Int) ->CategoryCollectionViewCellVM {
        return CategoryCollectionViewCellVM(dressCellObject: self.postsModel?[index] ?? PostsItem(), title: "")
    }
    
    func getItemDetailViewModel() ->ItemDetailViewModel {
        return ItemDetailViewModel(productDetails: self.productDetailsModel ?? ProductDetailsModel())
    }
    
    func getCategoryListTitle() ->[String] {
        var title = [String]()
        if let cateforyList =  self.categoryModel?.data {
            for item in cateforyList {
                title.append(item.name ?? "")
            }
        }
        return title
    }
    
    func sortByPrice(index: Int) {
        if index == 0 {
            self.postsModel =  self.postsModel?.sorted{$0.price?.specialPrice ?? 0 < $1.price?.specialPrice ?? 0} ?? [PostsItem]()
        } else if index == 1 {
            self.postsModel =  self.postsModel?.sorted{$0.price?.specialPrice ?? 0 > $1.price?.specialPrice ?? 0} ?? [PostsItem]()
        } else {
            self.postsModel = self.originalModel
        }
        self.reloadCollectionView?()
    }
}
