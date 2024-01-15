//
//  WishListViewControllerVM.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 15/01/24.
//

import Foundation
class WishListViewControllerVM {
    var dressArray: [DressCellObject]?
    
    init(dressArray: [DressCellObject]) {
        self.dressArray = dressArray
    }
    
    func getnumberOfRows() ->Int {
        return dressArray?.count ?? 0
    }
    
    func getCategoryCollectionViewCell(index: Int) ->CategoryCollectionViewCellVM {
        return CategoryCollectionViewCellVM(dressCellObject: self.dressArray?[index] ?? DressCellObject(), title: "")
    }
}
