//
//  OffersCollectionViewCellVM.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 05/01/24.
//

import Foundation
class OffersCollectionViewCellVM {
    var offer: Offers?
    
    init(offer: Offers) {
        self.offer = offer
    }
    
    func getImage() ->String {
        return self.offer?.image ?? ""
    }
}
