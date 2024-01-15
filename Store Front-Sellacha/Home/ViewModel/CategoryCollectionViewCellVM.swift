//
//  CategoryCollectionViewCellVM.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 05/01/24.
//

import Foundation
class CategoryCollectionViewCellVM {
    var dressCellObject: DressCellObject?
    var title: String?
    
    init(dressCellObject: DressCellObject, title: String) {
        self.dressCellObject = dressCellObject
        self.title = title
    }
    
    func getPrice() ->String {
        return dressCellObject?.price ?? ""
    }
    
    func isSelected() ->Bool {
        return dressCellObject?.isSelected ?? false
    }
    
    func getDescription() ->String {
        return dressCellObject?.description ?? ""
    }
    
    func getRating() ->String {
        return dressCellObject?.rating ?? ""
    }
    
    func getAddress() ->String {
        return self.dressCellObject?.description ?? ""
    }
    
    func getImageURL() ->String {
        return self.dressCellObject?.image ?? ""
    }
}
