//
//  CategoryTableViewCellVM.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 05/01/24.
//

import Foundation

struct StylistCellObject {
    var stylist: String?
    var isSelected: Bool?
    var speciality: String?
    var rating: String?
    var address: String?
    var image: String?
    var id: String?
    var salonId: String?
}

class CategoryTableViewCellVM {
    var stylistCellObject
    = [StylistCellObject]()
    var title: String?
    
    var previousIndex = Int()
    
    var reloadTableClosure:(()->())?
    
    init(stylistCellObject: [StylistCellObject],title: String) {
        self.title = title
        self.stylistCellObject = stylistCellObject
    }
    
    
    
    func getnumberOfRows() ->Int {
        return stylistCellObject.count
    }
    
    func gettStylistCollectionViewCellVM(indexRow: Int) ->CategoryCollectionViewCellVM {
        return CategoryCollectionViewCellVM(stylistCellObject: self.stylistCellObject[indexRow], title: self.title ?? "")
    }
    
    func updateValues(indexRow: Int) {
        let selectedItemIndex = self.stylistCellObject.firstIndex{$0.isSelected == true} ?? 0
        
        var item = self.stylistCellObject[selectedItemIndex]
        item.isSelected = false
        self.stylistCellObject.remove(at: selectedItemIndex)
        self.stylistCellObject.insert(item, at: selectedItemIndex)
        
        var selectedItem = self.stylistCellObject[indexRow]
        selectedItem.isSelected = true
        self.stylistCellObject.remove(at: indexRow)
        self.stylistCellObject.insert(selectedItem, at: indexRow)
        self.reloadTableClosure?()
    }
    
    func getSelectedItem(indexRow: Int) ->(String,String, String, String){
        let item = self.stylistCellObject[indexRow]
        return (item.stylist ?? "", item.speciality ?? "", item.salonId ?? "", item.id ?? "")
    }
    
}
