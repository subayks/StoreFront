//
//  CategoryCollectionViewCellVM.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 05/01/24.
//

import Foundation
class CategoryCollectionViewCellVM {
    var stylistCellObject: StylistCellObject?
    var title: String?
    
    init(stylistCellObject: StylistCellObject, title: String) {
        self.stylistCellObject = stylistCellObject
        self.title = title
    }
    
    func getStylist() ->String {
        return stylistCellObject?.stylist ?? ""
    }
    
    func isSelected() ->Bool {
        return stylistCellObject?.isSelected ?? false
    }
    
    func getSpeciality() ->String {
        return stylistCellObject?.speciality ?? ""
    }
    
    func getRating() ->String {
        return stylistCellObject?.rating ?? ""
    }
    
    func getAddress() ->String {
        return self.stylistCellObject?.address ?? ""
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
