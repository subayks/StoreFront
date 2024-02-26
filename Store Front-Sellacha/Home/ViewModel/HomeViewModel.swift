//
//  HomeViewModel.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 05/01/24.
//

import Foundation
import UIKit

class HomeViewModel: BaseViewModel {
    var apiServices: HomeApiServicesProtocol?
    var sliderModel: SliderModel?
    var productsModel: ProductsModel?
    var productDetailsModel: ProductDetailsModel?
    var reloadSliderCollectionView:(()->())?
    var loginModel: LoginModel?
    var setImageClosure: (()->())?
    var logoModel: LogoModel?
    
    var titles = ["Trending Products", "Best Selling Products", "New Arrival Products"]
    init(apiServices: HomeApiServicesProtocol = HomeApiService()) {
        self.apiServices = apiServices
    }
    
    func makeAuthCall() {
        if Reachability.isConnectedToNetwork() {
            // self.showLoadingIndicatorClosure?()
            
            let param =  self.getLoginParam(email: "storef@gmail.com", password: "12345678")
            
            self.apiServices?.makeAuthCall(finalURL: "\(CommonConfig.url.finalURL)/login", httpHeaders: [String:String](), withParameters: param, completion: { (status: Bool? , errorCode: String?,result: AnyObject?, errorMessage: String?) -> Void in
                DispatchQueue.main.async {
                    self.hideLoadingIndicatorClosure?()
                    if status == true  {
                        let model  = result as? BaseResponse<LoginModel>
                        self.loginModel = model?.data
                        if  self.loginModel?.email != "" {
                            let token = "Bearer " + (self.loginModel?.token ?? "")
                            print(token)
                            UserDefaults.standard.setValue(token, forKey: "ShopAuthToken")
                            if UserDefaults.standard.string(forKey: "logo") != "" &&  UserDefaults.standard.string(forKey: "logo") != nil {
                                self.getSliderInfo()
                            } else {
                                self.getLogo()
                            }
                        } else {
                            self.alertClosure?(errorMessage ?? "Some Technical Problem")
                        }
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
    
    func getLogo() {
        if Reachability.isConnectedToNetwork() {
            // self.showLoadingIndicatorClosure?()
            
            
            self.apiServices?.getLogo(finalURL: "\(CommonConfig.url.finalURL)/logos", httpHeaders: [String:String](), withParameters: "", completion: { (status: Bool? , errorCode: String?,result: AnyObject?, errorMessage: String?) -> Void in
                DispatchQueue.main.async {
                    self.hideLoadingIndicatorClosure?()
                    if status == true  {
                        let model  = result as? LogoModel
                        self.logoModel = model
                        let logo = (self.logoModel?.dataItem?.logo ?? "")
                        print(logo)
                        UserDefaults.standard.setValue(logo, forKey: "logo")
                        self.setImageClosure?()
                        self.getSliderInfo()
                    } else{
                        self.alertClosure?(errorMessage ?? "Some Technical Problem")
                    }
                }
            })
        }
        else {
            self.alertClosure?("No Internet Availabe")
        }
    }
    
    func getLoginParam(email: String, password: String) ->String {
        let jsonToReturn: NSDictionary = ["email": "\(email)",
                                          "password": "\(password)"]
        return self.convertDictionaryToJsonString(dict: jsonToReturn)!
    }
    
    func getSliderInfo() {
        if Reachability.isConnectedToNetwork() {
            //  self.showLoadingIndicatorClosure?()
            
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
            
            self.apiServices?.getProductsList(finalURL: "\(CommonConfig.url.finalURL)/home_page_products?latest_product=0&latest_product2=0&get_offerable_products=0&get_offerable_products2=0&trending_products2=0&best_selling_product=1&best_selling_product2=0&menu_category=0&menu_category2=0&bump_adds=0&banner_adds=0&featured_category=0&featured_category2=0&featured_brand=0&category_with_product=0&brand_with_product=0&random_product=1&trending_products=1", withParameters: "", completion: { (status: Bool? , errorCode: String?,result: AnyObject?, errorMessage: String?) -> Void in
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
    
    func getWelcomeTableViewCellVM() ->WelcomeTableViewCellVM {
        return WelcomeTableViewCellVM(posts: self.sliderModel?.posts ?? [SliderPost]())
    }
    
    func getCategoryTableViewCellVM(index: Int) ->CategoryTableViewCellVM {
        if index == 0 {
            return CategoryTableViewCellVM(dressCellObject:  self.productsModel?.getTrendingProducts  ?? [PostsItem](), title: titles[index])
        } else if index == 1 {
            return CategoryTableViewCellVM(dressCellObject:  self.productsModel?.getBestSellingProduct  ?? [PostsItem](), title: titles[index])
        } else {
            return CategoryTableViewCellVM(dressCellObject:  self.productsModel?.getRandomProducts  ?? [PostsItem](), title: titles[index])
        }
    }
    
    func getItemListViewModel(index: Int) ->ItemListViewModel {
        if index == 0 {
            return ItemListViewModel(postsModel: self.productsModel?.getTrendingProducts ?? [PostsItem](),title: titles[index], index: index)
        } else if index == 1 {
            return ItemListViewModel(postsModel: self.productsModel?.getBestSellingProduct ?? [PostsItem](),title: titles[index], index: index)
        } else {
            return ItemListViewModel(postsModel: self.productsModel?.getRandomProducts ?? [PostsItem](),title: titles[index], index: index)
        }
    }
    
    func getItemDetailViewModel() ->ItemDetailViewModel {
        return ItemDetailViewModel(productDetails: self.productDetailsModel ?? ProductDetailsModel())
    }
    
}
