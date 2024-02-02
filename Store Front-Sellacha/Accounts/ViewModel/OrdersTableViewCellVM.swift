//
//  OrdersTableViewCellVM.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 13/01/24.
//

import Foundation

class OrdersTableViewCellVM: BaseViewModel {
    var ordersInfo: OrdersData?
    
    init(ordersInfo: OrdersData) {
        self.ordersInfo = ordersInfo
    }
    
    func getOrdersCollectionViewCellVM(index: Int) ->OrdersCollectionViewCellVM {
        return OrdersCollectionViewCellVM(dressCellObject: DressCellObject(price: "",isSelected: false, description: "",rating: "0", image: "", id: self.ordersInfo?.orderNo ?? "",quantity: "1", productName: "No info"))
    }
}
