//
//  OrderDetailsViewControllerVM.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 13/01/24.
//

import Foundation

class OrderDetailsViewControllerVM: BaseViewModel {
    
    var ordersInfo: OrdersData?
    
    init(ordersInfo: OrdersData?) {
        self.ordersInfo = ordersInfo
    }
    
    
    func getAddressFilledTableViewCellVM() ->AddressFilledTableViewCellVM {
        AddressFilledTableViewCellVM(addressInfo: AddressInfo(streetName: "No Info",city: "No Info",state: "No Info", mob: "No Info"))
    }
    
    func getCardFilledTableViewCellVm() ->CardFilledTableViewCellVm {
        CardFilledTableViewCellVm(cardInfo: CardInfo())
    }
    
    func getBillInfoTableViewCellVM() ->BillInfoTableViewCellVM {
        BillInfoTableViewCellVM(billInfo: BillInfo(subtotal: "₹0",deliveryFee: "₹\(self.ordersInfo?.shipping ?? 0)",discount: "₹0",gst: "₹\(self.ordersInfo?.tax ?? 0)",total: "₹\(self.ordersInfo?.total ?? 0)"))
    }
    
    func getOrderInfoTableViewCellVM(index: Int) ->OrderInfoTableViewCellVM {
        OrderInfoTableViewCellVM(dressInfo: DressCellObject(price: "",isSelected: false, description: "",rating: "0", image: "", id: self.ordersInfo?.orderNo ?? "",quantity: "1", productName: "No info"))
    }
}
