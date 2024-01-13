//
//  OrderDetailsViewControllerVM.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 13/01/24.
//

import Foundation

class OrderDetailsViewControllerVM: BaseViewModel {
    
    var ordersInfo: OrdersInfo?
    
    init(ordersInfo: OrdersInfo?) {
        self.ordersInfo = ordersInfo
    }
    
    
    func getAddressFilledTableViewCellVM() ->AddressFilledTableViewCellVM {
        AddressFilledTableViewCellVM(addressInfo: self.ordersInfo?.addressInfo ?? AddressInfo())
    }
    
    func getCardFilledTableViewCellVm() ->CardFilledTableViewCellVm {
        CardFilledTableViewCellVm(cardInfo: self.ordersInfo?.cardInfo ?? CardInfo())
    }
    
    func getBillInfoTableViewCellVM() ->BillInfoTableViewCellVM {
        BillInfoTableViewCellVM(billInfo: self.ordersInfo?.billInfo ?? BillInfo())
    }
    
    func getOrderInfoTableViewCellVM(index: Int) ->OrderInfoTableViewCellVM {
        OrderInfoTableViewCellVM(dressInfo: self.ordersInfo?.dresses[index] ?? DressCellObject())
    }
}
