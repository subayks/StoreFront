//
//  OffersCollectionViewCellVM.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 05/01/24.
//

import Foundation
class OffersCollectionViewCellVM {
    var posts: Posts?
    
    init(posts: Posts) {
        self.posts = posts
    }
    
    func getImage() ->String {
        return self.posts?.name ?? ""
    }
}
