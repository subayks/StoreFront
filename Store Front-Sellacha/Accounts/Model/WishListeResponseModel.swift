//
//  WishListeResponseModel.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 31/01/24.
//

import Foundation
struct WishListeResponseModel: Codable {

  var dId        : String? = nil
  var attributes : String? = nil
  var options    : String? = nil
  var termId     : Int?    = nil
  var termTitle  : String? = nil
  var total      : Int?    = nil
  var preview    : String? = nil
  var price      : Int?    = nil

  enum CodingKeys: String, CodingKey {

    case dId        = "d_id"
    case attributes = "attributes"
    case options    = "options"
    case termId     = "term_id"
    case termTitle  = "term_title"
    case total      = "total"
    case preview    = "preview"
    case price      = "price"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    dId        = try values.decodeIfPresent(String.self , forKey: .dId        )
    attributes = try values.decodeIfPresent(String.self , forKey: .attributes )
    options    = try values.decodeIfPresent(String.self , forKey: .options    )
    termId     = try values.decodeIfPresent(Int.self    , forKey: .termId     )
    termTitle  = try values.decodeIfPresent(String.self , forKey: .termTitle  )
    total      = try values.decodeIfPresent(Int.self    , forKey: .total      )
    preview    = try values.decodeIfPresent(String.self , forKey: .preview    )
    price      = try values.decodeIfPresent(Int.self    , forKey: .price      )
 
  }

  init() {

  }

}
