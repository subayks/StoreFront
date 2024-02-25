//
//  AddtoCartModel.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 25/02/24.
//

import Foundation
struct AddtoCartModel: Codable {

  var userId     : String? = nil
  var attributes : String? = nil
  var options    : String? = nil
  var termId     : Int?    = nil
  var termTitle  : String? = nil
  var qty        : Int? = nil
  var total      : String? = nil
  var preview    : String? = nil
  var price      : Int?    = nil
  var count      : Int?    = nil
  var subtotal   : String? = nil
  var priceTotal : String? = nil
  var tax        : String? = nil

  enum CodingKeys: String, CodingKey {

    case userId     = "user_id"
    case attributes = "attributes"
    case options    = "options"
    case termId     = "term_id"
    case termTitle  = "term_title"
    case qty        = "qty"
    case total      = "total"
    case preview    = "preview"
    case price      = "price"
    case count      = "count"
    case subtotal   = "subtotal"
    case priceTotal = "priceTotal"
    case tax        = "tax"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    userId     = try values.decodeIfPresent(String.self , forKey: .userId     )
    attributes = try values.decodeIfPresent(String.self , forKey: .attributes )
    options    = try values.decodeIfPresent(String.self , forKey: .options    )
    termId     = try values.decodeIfPresent(Int.self    , forKey: .termId     )
    termTitle  = try values.decodeIfPresent(String.self , forKey: .termTitle  )
    qty        = try values.decodeIfPresent(Int.self , forKey: .qty        )
    total      = try values.decodeIfPresent(String.self , forKey: .total      )
    preview    = try values.decodeIfPresent(String.self , forKey: .preview    )
    price      = try values.decodeIfPresent(Int.self    , forKey: .price      )
    count      = try values.decodeIfPresent(Int.self    , forKey: .count      )
    subtotal   = try values.decodeIfPresent(String.self , forKey: .subtotal   )
    priceTotal = try values.decodeIfPresent(String.self , forKey: .priceTotal )
    tax        = try values.decodeIfPresent(String.self , forKey: .tax        )
 
  }

  init() {

  }

}
