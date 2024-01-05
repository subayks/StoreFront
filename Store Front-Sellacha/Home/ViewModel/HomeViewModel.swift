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
}
