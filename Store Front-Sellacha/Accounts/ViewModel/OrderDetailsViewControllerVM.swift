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
        BillInfoTableViewCellVM(billInfo: BillInfo(subtotal: "0",deliveryFee: "\(self.ordersInfo?.shipping ?? 0)",discount: "0",gst: "\(self.ordersInfo?.tax ?? 0)",total: "\(self.ordersInfo?.total ?? 0)"))
    }
    
    func getOrderInfoTableViewCellVM(index: Int) ->OrderInfoTableViewCellVM {
        OrderInfoTableViewCellVM(dressInfo: DressCellObject(price: String(self.ordersInfo?.order_item_with_file?[index].amount ?? 0),isSelected: false, description: "",rating: "0", image: "", id: self.ordersInfo?.orderNo ?? "",quantity: String(self.ordersInfo?.order_item_with_file?[index].qty ?? 0), productName: self.ordersInfo?.order_item_with_file?[index].term?.title ?? ""))
    }
    
    func convertDateFormat(inputDate: String) -> String {

         let olDateFormatter = DateFormatter()
         olDateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSXXX"

         let oldDate = olDateFormatter.date(from: inputDate)

         let convertDateFormatter = DateFormatter()
         convertDateFormatter.dateFormat = "dd MMM yyyy"

         return convertDateFormatter.string(from: oldDate!)
    }
}
