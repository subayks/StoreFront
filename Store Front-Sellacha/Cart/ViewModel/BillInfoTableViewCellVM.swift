//
//  BillInfoTableViewCellVM.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 09/01/24.
//

import Foundation
struct BillInfo {
    var subtotal: String?
    var deliveryFee: String?
    var discount: String?
    var gst: String?
    var total: String?
}

class BillInfoTableViewCellVM {
    var billInfo: BillInfo?
    
    init(billInfo: BillInfo) {
        self.billInfo = billInfo
    }
}
