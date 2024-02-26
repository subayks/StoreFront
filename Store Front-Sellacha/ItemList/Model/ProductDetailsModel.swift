//
//  ProductDetailsModel.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 31/01/24.
//

import Foundation

struct ProductDetailsModel: Codable {

  var info       : PostsItem?     = PostsItem()
  var sch        : [Sch]?    = []
  var next       : PostsItem?     = PostsItem()
  var previous   : PostsItem? = PostsItem()
  var variations : [String]? = []
  var content    : Content?  = Content()
    var wishlist: String? = nil
  enum CodingKeys: String, CodingKey {

    case info       = "info"
    case sch        = "sch"
    case next       = "next"
    case previous   = "previous"
    case variations = "variations"
    case content    = "content"
  case wishlist = "wishlist"
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    info       = try values.decodeIfPresent(PostsItem.self     , forKey: .info       )
    sch        = try values.decodeIfPresent([Sch].self    , forKey: .sch        )
    next       = try values.decodeIfPresent(PostsItem.self     , forKey: .next       )
    previous   = try values.decodeIfPresent(PostsItem.self , forKey: .previous   )
    variations = try values.decodeIfPresent([String].self , forKey: .variations )
    content    = try values.decodeIfPresent(Content.self  , forKey: .content    )
      wishlist = try values.decodeIfPresent(String.self  , forKey: .wishlist    )
  }

  init() {

  }

}

struct Sch: Codable {

  var id        : Int?    = nil
  var dayName   : String? = nil
  var startTime : String? = nil
  var endTime   : String? = nil
  var status    : String? = nil
  var userId    : String? = nil
  var date      : String? = nil
  var updatedAt : String? = nil
  var createdAt : String? = nil

  enum CodingKeys: String, CodingKey {

    case id        = "id"
    case dayName   = "day_name"
    case startTime = "start_time"
    case endTime   = "end_time"
    case status    = "status"
    case userId    = "user_id"
    case date      = "date"
    case updatedAt = "updated_at"
    case createdAt = "created_at"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    id        = try values.decodeIfPresent(Int.self    , forKey: .id        )
    dayName   = try values.decodeIfPresent(String.self , forKey: .dayName   )
    startTime = try values.decodeIfPresent(String.self , forKey: .startTime )
    endTime   = try values.decodeIfPresent(String.self , forKey: .endTime   )
    status    = try values.decodeIfPresent(String.self , forKey: .status    )
    userId    = try values.decodeIfPresent(String.self , forKey: .userId    )
    date      = try values.decodeIfPresent(String.self , forKey: .date      )
    updatedAt = try values.decodeIfPresent(String.self , forKey: .updatedAt )
    createdAt = try values.decodeIfPresent(String.self , forKey: .createdAt )
 
  }

  init() {

  }

}
