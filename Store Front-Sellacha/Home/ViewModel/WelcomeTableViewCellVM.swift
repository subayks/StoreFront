//
//  WelcomeTableViewCellVM.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 05/01/24.
//

import Foundation
struct Offers {
    var image: String?
    var id: String?
}

class WelcomeTableViewCellVM {
    
    var offers: [Offers]?
    
    init(offers: [Offers]) {
        self.offers = offers
    }
    
    func getNumberOfItems() ->Int {
        return offers?.count ?? 0
    }
    
    func getOffersCollectionViewCellVM(index: Int) ->OffersCollectionViewCellVM {
        return OffersCollectionViewCellVM(offer: offers?[index] ?? Offers())
    }
    
}
