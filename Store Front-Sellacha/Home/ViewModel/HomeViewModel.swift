//
//  HomeViewModel.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 05/01/24.
//

import Foundation

class HomeViewModel: BaseViewModel {
    func getWelcomeTableViewCellVM() ->WelcomeTableViewCellVM {
        var offers = [Offers]()
        let imageList = ["Offer2", "Offer3", "Offer1", "Offer4"]
        for item in imageList {
            var offer = Offers()
            offer.image = item
            offer.id = "111"
            offers.append(offer)
        }
        return WelcomeTableViewCellVM(offers: offers)
    }
    
    func getMensCollectionList() ->CategoryTableViewCellVM {
        return CategoryTableViewCellVM(dressCellObject: self.getDressArray(), title: "Men's Fashion")
    }
    
    func getDressArray() -> [DressCellObject] {
        var dressArray = [DressCellObject]()
        
        var dressItem1 = DressCellObject()
        dressItem1.price = "₹1000"
        dressItem1.id = "1"
        dressItem1.isSelected = false
        dressItem1.description = "Suits Well For your skin tone & best fabric"
        dressItem1.image = ""
        dressItem1.rating = "5.0"
        dressArray.append(dressItem1)

        var dressItem2 = DressCellObject()
        dressItem2.price = "₹2000"
        dressItem2.id = "2"
        dressItem2.isSelected = false
        dressItem2.description = "Suits Well For your skin tone & best fabric"
        dressItem2.image = ""
        dressItem2.rating = "4.0"
        dressArray.append(dressItem2)
        
        var dressItem3 = DressCellObject()
        dressItem3.price = "₹2,200"
        dressItem3.id = "3"
        dressItem3.isSelected = false
        dressItem3.description = "Suits Well For your skin tone & best fabric"
        dressItem3.image = ""
        dressItem3.rating = "3.0"
        dressArray.append(dressItem3)
        
        var dressItem4 = DressCellObject()
        dressItem4.price = "₹1,200"
        dressItem4.id = "4"
        dressItem4.isSelected = false
        dressItem4.description = "Suits Well For your skin tone & best fabric"
        dressItem4.image = ""
        dressItem4.rating = "2.0"
        dressArray.append(dressItem4)
        
        var dressItem5 = DressCellObject()
        dressItem5.price = "₹500"
        dressItem5.id = "5"
        dressItem5.isSelected = false
        dressItem5.description = "Suits Well For your skin tone & best fabric"
        dressItem5.image = ""
        dressItem5.rating = "1.0"
        dressArray.append(dressItem5)

        return dressArray
    }
}
