//
//  DestroyCartModel.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 01/02/24.
//

import Foundation
struct DestroyCartModel: Codable {

  var success : Bool?   = nil
  var data    : String? = nil

  enum CodingKeys: String, CodingKey {

    case success = "success"
    case data    = "data"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    success = try values.decodeIfPresent(Bool.self   , forKey: .success )
    data    = try values.decodeIfPresent(String.self , forKey: .data    )
 
  }

  init() {

  }

}
