//
//  CommonConfig.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 07/01/24.
//

import Foundation
import UIKit

class CommonConfig {
    
    struct colors {
        static let themeColor = UIColor(red: 29/255, green: 160/255, blue: 242/255, alpha: 1)
        static let themeLightColor = UIColor(red: 216/255, green: 239/255, blue: 253/255, alpha: 1)
        //#D8EFFD
        static let appSmallLogo = UIImage(named: "SmallLogo")
    }
    
    struct messages {
        static let PHOTOS_ACCESS_ALERT = "Please enable access for photos, We would like to access your pictures or videos to set up a customised profile picture to stay unique among our users"
    }
    
    struct url {
        static let finalURL = "https://karidari.com/api"
        static let imageBaseUrl = "https://storefront.sellacha.com/"
        static let createProductURL = "http://thedemostore.in/api/store"
    }
}
