//
//  CartTableViewCellVM.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 06/01/24.
//

import Foundation
struct ProductInfo {
    var image: String?
    var id: String?
    var name: String?
    var color: String?
    var size: String?
    var description: String?
    var price: String?
    var ogPrice: String?
}

class CartTableViewCellVM {
    
    var productInfo: [ProductInfo]?
    var currentCount: Int?
    
//    init(productInfo: [ProductInfo]) {
//        self.productInfo = productInfo
//    }
    
    init(currentCount: Int) {
        self.currentCount = currentCount
    }

    
}
