//
//  OrdersViewControllerVM.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 13/01/24.
//

import Foundation
import UIKit

class OrdersViewControllerVM: BaseViewModel {
    var ordersModel: OrdersModel?
    var list: [OrdersData]? {
        didSet {
            self.reloadTableView?()
        }
    }
    var selectedIndex = 0
    var apiServices: AccountsApiServiceProtocol?

    init(apiServices: AccountsApiServiceProtocol = AccountsApiService()) {
        self.apiServices = apiServices
    }
    
    init(ordersModel: OrdersModel,apiServices: AccountsApiServiceProtocol = AccountsApiService()) {
        self.ordersModel = ordersModel
        self.apiServices = apiServices
        self.list = ordersModel.orders?.data
    }
    
    func getActiveList() ->[OrdersData] {
        return self.list?.filter{$0.status?.lowercased() == "pending"} ?? [OrdersData]()
    }
    
    func getPastList() ->[OrdersData] {
        return self.list?.filter{$0.status?.lowercased() == "completed" || $0.status?.lowercased() == "canceled"} ?? [OrdersData]()
    }
    
    func getOrdersTableViewCellVM(index: Int) ->OrdersTableViewCellVM {
        if selectedIndex == 0 {
            return OrdersTableViewCellVM(ordersInfo: self.getActiveList()[index])

        } else {
            return OrdersTableViewCellVM(ordersInfo: self.getPastList()[index])

        }
    }
    
    func getOrderDetailsViewControllerVM(index: Int) ->OrderDetailsViewControllerVM {
        if selectedIndex == 0 {
           return OrderDetailsViewControllerVM(ordersInfo: self.getActiveList()[index])
        } else {
            return OrderDetailsViewControllerVM(ordersInfo: self.getPastList()[index])
        }
    }
}
