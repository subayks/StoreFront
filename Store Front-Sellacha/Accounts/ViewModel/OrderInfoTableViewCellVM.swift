//
//  OrderInfoTableViewCellVM.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 13/01/24.
//

import Foundation
class OrderInfoTableViewCellVM: BaseViewModel {
    var dressInfo: DressCellObject?
    
    init(dressInfo: DressCellObject) {
        self.dressInfo = dressInfo
    }
}
