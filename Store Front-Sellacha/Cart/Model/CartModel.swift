//
//  CartModel.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 31/01/24.
//

import Foundation
struct CartModel: Codable {

  var items : [CartItems]? = []

  enum CodingKeys: String, CodingKey {

    case items = "items"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    items = try values.decodeIfPresent([CartItems].self , forKey: .items )
 
  }

  init() {

  }

}


struct CartItems: Codable {

  var id         : Int?    = nil
  var termId     : String? = nil
  var termTitle  : String? = nil
  var attributes : String? = nil
  var options    : String? = nil
  var qty        : String? = nil
  var price      : String? = nil
  var preview    : String? = nil
  var subtotal   : String? = nil
  var finalTotal : Int?    = nil

  enum CodingKeys: String, CodingKey {

    case id         = "id"
    case termId     = "term_id"
    case termTitle  = "term_title"
    case attributes = "attributes"
    case options    = "options"
    case qty        = "qty"
    case price      = "price"
    case preview    = "preview"
    case subtotal   = "subtotal"
    case finalTotal = "final_total"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    id         = try values.decodeIfPresent(Int.self    , forKey: .id         )
    termId     = try values.decodeIfPresent(String.self , forKey: .termId     )
    termTitle  = try values.decodeIfPresent(String.self , forKey: .termTitle  )
    attributes = try values.decodeIfPresent(String.self , forKey: .attributes )
    options    = try values.decodeIfPresent(String.self , forKey: .options    )
    qty        = try values.decodeIfPresent(String.self , forKey: .qty        )
    price      = try values.decodeIfPresent(String.self , forKey: .price      )
    preview    = try values.decodeIfPresent(String.self , forKey: .preview    )
    subtotal   = try values.decodeIfPresent(String.self , forKey: .subtotal   )
    finalTotal = try values.decodeIfPresent(Int.self    , forKey: .finalTotal )
 
  }

  init() {

  }

}
