//
//  DescriptionTableViewCellVM.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 21/03/24.
//
struct DescModel {
    var desc: String?
}

import Foundation
class DescriptionTableViewCellVM {
    var descModel: DescModel?
    
    init(descModel: DescModel? = nil) {
        self.descModel = descModel
    }
}
