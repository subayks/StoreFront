//
//  OffersCollectionViewCellVM.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 05/01/24.
//

import Foundation
class OffersCollectionViewCellVM {
    var posts: SliderPost?
    
    init(posts: SliderPost) {
        self.posts = posts
    }
    
    func getImage() ->String {
        return self.posts?.name ?? ""
    }
}
