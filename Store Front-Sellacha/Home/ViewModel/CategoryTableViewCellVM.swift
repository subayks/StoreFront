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
    var dressCellObject
    = [DressCellObject]()
    var title: String?
    
    var previousIndex = Int()
    
    var reloadTableClosure:(()->())?
    
    init(dressCellObject: [DressCellObject],title: String) {
        self.title = title
        self.dressCellObject = dressCellObject
    }
    
    
    
    func getnumberOfRows() ->Int {
        return dressCellObject.count
    }
    
    func gettStylistCollectionViewCellVM(indexRow: Int) ->CategoryCollectionViewCellVM {
        return CategoryCollectionViewCellVM(dressCellObject: self.dressCellObject[indexRow], title: self.title ?? "")
    }
    
    func updateValues(indexRow: Int) {
        let selectedItemIndex = self.dressCellObject.firstIndex{$0.isSelected == true} ?? 0
        
        var item = self.dressCellObject[selectedItemIndex]
        item.isSelected = false
        self.dressCellObject.remove(at: selectedItemIndex)
        self.dressCellObject.insert(item, at: selectedItemIndex)
        
        var selectedItem = self.dressCellObject[indexRow]
        selectedItem.isSelected = true
        self.dressCellObject.remove(at: indexRow)
        self.dressCellObject.insert(selectedItem, at: indexRow)
        self.reloadTableClosure?()
    }
    
    func getSelectedItem(indexRow: Int) ->(String,String, String, String){
        let item = self.dressCellObject[indexRow]
        return (item.price ?? "", item.description ?? "", item.id ?? "", item.id ?? "")
    }
    
}
