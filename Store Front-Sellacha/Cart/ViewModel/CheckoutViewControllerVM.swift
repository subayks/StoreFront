//
//  CheckoutViewControllerVM.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 09/01/24.
//

import Foundation
import UIKit

class CheckoutViewControllerVM: BaseViewModel {
    var cartModel: CartModel?
    var apiServices: CartApiServiceProtocol?
    var makeCartResonse: DestroyCartModel?
    var addressInfo: AddressInfo? {
        didSet {
            self.reloadTableView?()
        }
    }
    
    var cardInfo: CardInfo? {
        didSet {
            self.reloadTableView?()
        }
    }
    
    init( cartModel: CartModel, apiServices: CartApiServiceProtocol = CartApiService()) {
        self.cartModel = cartModel
        self.apiServices = apiServices
    }
    
    init(apiServices: CartApiServiceProtocol = CartApiService()) {
        self.apiServices = apiServices
    }
    
    func makeCart() {
        if Reachability.isConnectedToNetwork() {
            self.showLoadingIndicatorClosure?()
            let name = UserDefaults.standard.string(forKey: "userName") ?? ""
            let email = UserDefaults.standard.string(forKey: "email") ?? ""
            let phoneNumber = UserDefaults.standard.string(forKey: "phoneNumber") ?? ""
            self.apiServices?.makeOrder(finalURL: "\(CommonConfig.url.finalURL)/make_order?customer_type=1&delivery_type=1&shipping_method=&payment_id=&payment_method=1&payment_status=2&name=Alauddin Ansari&email=alauddinansari7379@gmail.com&phone=7379452259&comment=&address=New Market Hyderabad&zip_code=500082&location=Hyderabad&device_id=c62700640ddcd2e2&total=3000&discount=00&tax=00", httpHeaders: [String:String](), withParameters: "", completion: { (status: Bool? , errorCode: String?,result: AnyObject?, errorMessage: String?) -> Void in
                DispatchQueue.main.async {
                    self.hideLoadingIndicatorClosure?()
                    if status == true {
                        let model  = result as? BaseResponse<DestroyCartModel>
                        self.makeCartResonse = model?.data
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
    
    
    func getAddressCardTableViewCellVM() ->CardTableViewCellVM {
        return CardTableViewCellVM(cardInfo: CardInfo(image: UIImage(named: "Location"),title: "Add Address"))
    }
    
    func getPaymentCardTableViewCellVM() ->CardTableViewCellVM {
        return CardTableViewCellVM(cardInfo: CardInfo(image: UIImage(named: "Payments"),title: "Add Payment Method"))
    }
    
    func getAddressFilledTableViewCellVM() ->AddressFilledTableViewCellVM {
        return AddressFilledTableViewCellVM(addressInfo: self.addressInfo ?? AddressInfo())
    }
    
    func getCardFilledTableViewCellVm() ->CardFilledTableViewCellVm {
        return CardFilledTableViewCellVm(cardInfo: self.cardInfo ?? CardInfo())
    }
}
