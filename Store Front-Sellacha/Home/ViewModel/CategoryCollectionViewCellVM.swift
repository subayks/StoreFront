//
//  CategoryCollectionViewCellVM.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 05/01/24.
//

import Foundation
class CategoryCollectionViewCellVM {
    var stylistCellObject: DressCellObject?
    var title: String?
    
    init(stylistCellObject: DressCellObject, title: String) {
        self.stylistCellObject = stylistCellObject
        self.title = title
    }
    
    func getPrice() ->String {
        return stylistCellObject?.price ?? ""
    }
    
    func isSelected() ->Bool {
        return stylistCellObject?.isSelected ?? false
    }
    
    func getDescription() ->String {
        return stylistCellObject?.description ?? ""
    }
    
    func getRating() ->String {
        return stylistCellObject?.rating ?? ""
    }
    
    func getAddress() ->String {
        return self.stylistCellObject?.description ?? ""
    }
    
    func getImageURL() ->String {
        return self.stylistCellObject?.image ?? ""
    }
    
    func isStylistCell() ->Bool {
        if self.title == "Popular Stylist" || self.title == "Stylist" {
            return true
        } else {
            return false
        }
    }
}
