//
//  ItemImageTableViewCellVM.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 31/01/24.
//

import Foundation
struct ItemImageObject {
    var itemDesc: String?
    var ratingCount: String?
    var itemName: String?
    var itemImage: String?
}

class ItemImageTableViewCellVM {
    var ordersInfo: ItemImageObject?
    
    init(ordersInfo: ItemImageObject) {
        self.ordersInfo = ordersInfo
    }
}
