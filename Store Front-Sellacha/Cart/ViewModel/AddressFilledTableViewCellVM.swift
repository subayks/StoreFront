//
//  AddressFilledTableViewCellVM.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 10/01/24.
//

import Foundation
struct AddressInfo {
    var streetName: String?
    var city: String?
    var state: String?
    var mob: String?
}
class AddressFilledTableViewCellVM {
    var addressInfo: AddressInfo?
    
    init(addressInfo: AddressInfo) {
        self.addressInfo = addressInfo
    }
}
