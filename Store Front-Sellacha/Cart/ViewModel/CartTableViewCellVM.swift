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
    
    var productInfo: CartItems?
    var currentCount: Int?
    
    init(productInfo: CartItems) {
        self.productInfo = productInfo
    }

    
}
