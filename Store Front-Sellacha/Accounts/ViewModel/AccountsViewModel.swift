//
//  AccountsViewModel.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 07/01/24.
//

import Foundation
import Photos
import UIKit

class AccountsViewModel: BaseViewModel {
    func getWishListViewControllerVM() ->WishListViewControllerVM {
        return WishListViewControllerVM(dressArray: self.getDressArray())
    }
    
    func getDressArray() -> [DressCellObject] {
        var dressArray = [DressCellObject]()
        
        var dressItem1 = DressCellObject()
        dressItem1.price = "₹1000"
        dressItem1.id = "1"
        dressItem1.isSelected = false
        dressItem1.description = "Suits Well For your skin tone & best fabric"
        dressItem1.image = "Men"
        dressItem1.rating = "5.0"
        dressItem1.quantity = "2"
        dressItem1.productName = "Jean"
        dressArray.append(dressItem1)

        var dressItem2 = DressCellObject()
        dressItem2.price = "₹2000"
        dressItem2.id = "2"
        dressItem2.isSelected = false
        dressItem2.description = "Suits Well For your skin tone & best fabric"
        dressItem2.image = "Kids"
        dressItem2.rating = "4.0"
        dressItem2.quantity = "2"
        dressItem2.productName = "Pant"
        dressArray.append(dressItem2)
        
        var dressItem3 = DressCellObject()
        dressItem3.price = "₹2,200"
        dressItem3.id = "3"
        dressItem3.isSelected = false
        dressItem3.description = "Suits Well For your skin tone & best fabric"
        dressItem3.image = "Formals"
        dressItem3.rating = "3.0"
        dressItem3.quantity = "2"
        dressItem3.productName = "T-Shirt"
        dressArray.append(dressItem3)
        
        var dressItem4 = DressCellObject()
        dressItem4.price = "₹1,200"
        dressItem4.id = "4"
        dressItem4.isSelected = false
        dressItem4.description = "Suits Well For your skin tone & best fabric"
        dressItem4.image = "Men"
        dressItem4.rating = "2.0"
        dressItem4.quantity = "2"
        dressItem4.productName = "Track"
        dressArray.append(dressItem4)
        
        var dressItem5 = DressCellObject()
        dressItem5.price = "₹500"
        dressItem5.id = "5"
        dressItem5.isSelected = false
        dressItem5.description = "Suits Well For your skin tone & best fabric"
        dressItem5.image = "Formals"
        dressItem5.rating = "1.0"
        dressItem5.quantity = "2"
        dressItem5.productName = "Jacket"
        dressArray.append(dressItem5)

        return dressArray
    }
}
