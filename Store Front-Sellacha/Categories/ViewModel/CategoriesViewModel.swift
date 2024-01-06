//
//  CategoriesViewModel.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 05/01/24.
//

import Foundation
class CategoriesViewModel: BaseViewModel {
    func getWelcomeTableViewCellVM(index: Int) ->OffersCollectionViewCellVM {
        var offers = [Offers]()
        let imageList = ["Women", "Men", "Kids", "Offer4", "Offer1"]
        for item in imageList {
            var offer = Offers()
            offer.image = item
            offer.id = "111"
            offers.append(offer)
        }
        return OffersCollectionViewCellVM(offer: offers[index])
    }
}
