//
//  CategoryCollectionViewCellVM.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 05/01/24.
//

import Foundation
class CategoryCollectionViewCellVM {
    var dressCellObject: PostsItem?
    var title: String?
    
    init(dressCellObject: PostsItem, title: String) {
        self.dressCellObject = dressCellObject
        self.title = title
    }
    
    func getPrice() ->Int {
        return dressCellObject?.price?.specialPrice == nil ? dressCellObject?.price?.price ?? 0:  dressCellObject?.price?.specialPrice ?? 0
    }
    
    func getOgPrice() ->Int {
        return dressCellObject?.price?.specialPrice == nil ? 0: dressCellObject?.price?.price ?? 0
    }
    
    func getDescription() ->String {
        return "Not Coming From Api"
    }
    
    func getRating() ->String {
        return "0"
    }
    
    func getImageURL() ->String {
        if self.dressCellObject?.medias?.count ?? 0 > 0 {
            return self.dressCellObject?.medias?[0].url ?? ""
        } else {
            return self.dressCellObject?.preview?.url ?? ""
        }
    }
}
