//
//  OrdersTableViewCellVM.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 13/01/24.
//

import Foundation

class OrdersTableViewCellVM: BaseViewModel {
    var ordersInfo: OrdersInfo?
    
    init(ordersInfo: OrdersInfo) {
        self.ordersInfo = ordersInfo
    }
    
    func getOrdersCollectionViewCellVM(index: Int) ->OrdersCollectionViewCellVM {
        return OrdersCollectionViewCellVM(dressCellObject: self.ordersInfo?.dresses[index] ?? DressCellObject())
    }
}
