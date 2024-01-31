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
    
    var posts: [SliderPost]?
    
    init(posts: [SliderPost]) {
        self.posts = posts
    }
    
    func getNumberOfItems() ->Int {
        return posts?.count ?? 0
    }
    
    func getOffersCollectionViewCellVM(index: Int) ->OffersCollectionViewCellVM {
        return OffersCollectionViewCellVM(posts: posts?[index] ?? SliderPost())
    }
    
}
