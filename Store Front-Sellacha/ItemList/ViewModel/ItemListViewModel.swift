//
//  ItemListViewModel.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 26/01/24.
//

import Foundation
class ItemListViewModel: BaseViewModel {
    var dressArray: [DressCellObject]?
    var title: String?
    
    var brandArray = ["Puma", "Adidas", "Polo", "LP"]
    var sortArray = ["Low to High", "High to Low", "Discount"]
    var filterArray = ["Men", "Women", "Kids"]
    
    init(dressArray: [DressCellObject], title: String) {
        self.dressArray = dressArray
        self.title = title
    }
    
    func getnumberOfRows() ->Int {
        return dressArray?.count ?? 0
    }
    
    func getCategoryCollectionViewCell(index: Int) ->CategoryCollectionViewCellVM {
        return CategoryCollectionViewCellVM(dressCellObject: self.dressArray?[index] ?? DressCellObject(), title: "")
    }
}
