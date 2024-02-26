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
            let deviceId = UIDevice.current.identifierForVendor!.uuidString
            var address = "\(self.addressInfo?.streetName ?? "") \(self.addressInfo?.city ?? "") \(self.addressInfo?.state ?? "")"
            self.apiServices?.makeOrder(finalURL: "\(CommonConfig.url.finalURL)/make_order?customer_type=1&delivery_type=1&shipping_method&payment_id=7897&payment_method=2&tax=0&total=\(self.totalBill())&name=\(name)&email=\(email)&phone=\(phoneNumber)&comment=test comment&address=\(address)&zip_code=\(self.addressInfo?.zipCode ?? "")&location=India&device_id=\(deviceId)&trans_id=\(self.cartModel?.items?[0].termId ?? "")", httpHeaders: [String:String](), withParameters: "", completion: { (status: Bool? , errorCode: String?,result: AnyObject?, errorMessage: String?) -> Void in
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
    
    func totalBill() ->String{
        var amountArray = [Int]()
        if let cartItems  = self.cartModel?.items {
            for item in cartItems {
                amountArray.append(item.finalTotal ?? 0)
            }
        }
        let total = amountArray.reduce(0, { $0 + $1 })
        return String(total)
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
    
    func getBillInfoTableViewCellVM() ->BillInfoTableViewCellVM {
        return BillInfoTableViewCellVM(billInfo: BillInfo(subtotal: self.totalSubTotalBill(), deliveryFee: "0", discount: "0", gst: "0" , total: self.totalBill()))
    }
    
    func totalSubTotalBill() ->String{
        var amountArray = [Int]()
        if let cartItems  = self.cartModel?.items {
            for item in cartItems {
                amountArray.append(Int(item.price ?? "") ?? 0)
            }
        }
        let total = amountArray.reduce(0, { $0 + $1 })
        return String(total)
    }
}
