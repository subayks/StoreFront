//
//  CategoryTableViewCellVM.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 05/01/24.
//

import Foundation

struct DressCellObject {
    var price: String?
    var isSelected: Bool?
    var description: String?
    var rating: String?
    var image: String?
    var id: String?
    var quantity: String?
    var productName: String?
}

class CategoryTableViewCellVM {
    var dressCellObject: [PostsItem]?
    var title: String?
    var previousIndex = Int()

    init(dressCellObject: [PostsItem],title: String) {
        self.title = title
        self.dressCellObject = dressCellObject
    }
    
    func getnumberOfRows() ->Int {
        return dressCellObject?.count ?? 0
    }
    
    func gettStylistCollectionViewCellVM(indexRow: Int) ->CategoryCollectionViewCellVM {
        return CategoryCollectionViewCellVM(dressCellObject: self.dressCellObject?[indexRow] ?? PostsItem(), title: self.title ?? "")
    }
    
}
