//
//  LogoModel.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 25/02/24.
//

import Foundation
struct LogoModel: Codable {

    var success : Bool? = nil
    var dataItem : logoData? = nil

    enum CodingKeys: String, CodingKey {
        case success = "success"
        case dataItem = "data"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        success =  try values.decodeIfPresent(Bool.self     , forKey: .success)
        dataItem =  try values.decodeIfPresent(logoData.self     , forKey: .dataItem)

    }
    
    init() {
}
}

struct logoData: Codable {
    var logo: String? = nil
    
    enum CodingKeys: String, CodingKey {
        case logo = "logo"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        logo =  try values.decodeIfPresent(String.self     , forKey: .logo)
    }
    
    init() {

    }
}
