//
//  AddItemModel.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 03/02/24.
//

import Foundation
struct AddItemModel: Codable {

  var userId     : String? = nil
  var attributes : String? = nil
  var options    : String? = nil
  var termId     : Int?    = nil
  var termTitle  : String? = nil
  var qty        : String? = nil
  var total      : String? = nil
  var preview    : String? = nil
  var price      : Int?    = nil
  var count      : Int?    = nil
  var subtotal   : String? = nil
  var priceTotal : String? = nil
  var tax        : String? = nil
  var items      : Items?  = Items()

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
    case items      = "items"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    userId     = try values.decodeIfPresent(String.self , forKey: .userId     )
    attributes = try values.decodeIfPresent(String.self , forKey: .attributes )
    options    = try values.decodeIfPresent(String.self , forKey: .options    )
    termId     = try values.decodeIfPresent(Int.self    , forKey: .termId     )
    termTitle  = try values.decodeIfPresent(String.self , forKey: .termTitle  )
    qty        = try values.decodeIfPresent(String.self , forKey: .qty        )
    total      = try values.decodeIfPresent(String.self , forKey: .total      )
    preview    = try values.decodeIfPresent(String.self , forKey: .preview    )
    price      = try values.decodeIfPresent(Int.self    , forKey: .price      )
    count      = try values.decodeIfPresent(Int.self    , forKey: .count      )
    subtotal   = try values.decodeIfPresent(String.self , forKey: .subtotal   )
    priceTotal = try values.decodeIfPresent(String.self , forKey: .priceTotal )
    tax        = try values.decodeIfPresent(String.self , forKey: .tax        )
    items      = try values.decodeIfPresent(Items.self  , forKey: .items      )
 
  }

  init() {

  }

}

struct Items: Codable {

  var c042c05751ee6df2a7b107212ae6211c : ShopKey? = ShopKey()

  enum CodingKeys: String, CodingKey {

    case c042c05751ee6df2a7b107212ae6211c = "c042c05751ee6df2a7b107212ae6211c"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    c042c05751ee6df2a7b107212ae6211c = try values.decodeIfPresent(ShopKey.self , forKey: .c042c05751ee6df2a7b107212ae6211c )
 
  }

  init() {

  }

}

struct ShopKey: Codable {

  var rowId    : String?  = nil
  var id       : Int?     = nil
  var name     : String?  = nil
  var qty      : String?  = nil
  var price    : Int?     = nil
  var weight   : Int?     = nil
  var options  : Options? = Options()
  var discount : Int?     = nil
  var tax      : Int?     = nil
  var subtotal : Int?     = nil

  enum CodingKeys: String, CodingKey {

    case rowId    = "rowId"
    case id       = "id"
    case name     = "name"
    case qty      = "qty"
    case price    = "price"
    case weight   = "weight"
    case options  = "options"
    case discount = "discount"
    case tax      = "tax"
    case subtotal = "subtotal"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    rowId    = try values.decodeIfPresent(String.self  , forKey: .rowId    )
    id       = try values.decodeIfPresent(Int.self     , forKey: .id       )
    name     = try values.decodeIfPresent(String.self  , forKey: .name     )
    qty      = try values.decodeIfPresent(String.self  , forKey: .qty      )
    price    = try values.decodeIfPresent(Int.self     , forKey: .price    )
    weight   = try values.decodeIfPresent(Int.self     , forKey: .weight   )
    options  = try values.decodeIfPresent(Options.self , forKey: .options  )
    discount = try values.decodeIfPresent(Int.self     , forKey: .discount )
    tax      = try values.decodeIfPresent(Int.self     , forKey: .tax      )
    subtotal = try values.decodeIfPresent(Int.self     , forKey: .subtotal )
 
  }

  init() {

  }

}

struct Options: Codable {

  var attribute : [String]? = []
  var options   : [String]? = []
  var preview   : String?   = nil

  enum CodingKeys: String, CodingKey {

    case attribute = "attribute"
    case options   = "options"
    case preview   = "preview"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    attribute = try values.decodeIfPresent([String].self , forKey: .attribute )
    options   = try values.decodeIfPresent([String].self , forKey: .options   )
    preview   = try values.decodeIfPresent(String.self   , forKey: .preview   )
 
  }

  init() {

  }

}

