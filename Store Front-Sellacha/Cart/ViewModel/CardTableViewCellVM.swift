//
//  CardTableViewCellVM.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 09/01/24.
//

import Foundation
import UIKit

struct CardInfo {
    var image: UIImage?
    var title: String?
}

class CardTableViewCellVM {
    var cardInfo: CardInfo?
    
    init(cardInfo: CardInfo) {
        self.cardInfo = cardInfo
    }
}
