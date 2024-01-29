//
//  SliderModel.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 29/01/24.
//

import Foundation
struct SliderModel: Codable {

  var posts : [Posts]? = []

  enum CodingKeys: String, CodingKey {

    case posts = "posts"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    posts = try values.decodeIfPresent([Posts].self , forKey: .posts )
 
  }

  init() {

  }

}

struct Posts: Codable {

  var id         : Int?    = nil
  var name       : String? = nil
  var slug       : String? = nil
  var type       : String? = nil
  var pId        : String? = nil
  var featured   : Int?    = nil
  var menuStatus : Int?    = nil
  var isAdmin    : Int?    = nil
  var createdAt  : String? = nil
  var updatedAt  : String? = nil
  var userId     : Int?    = nil

  enum CodingKeys: String, CodingKey {

    case id         = "id"
    case name       = "name"
    case slug       = "slug"
    case type       = "type"
    case pId        = "p_id"
    case featured   = "featured"
    case menuStatus = "menu_status"
    case isAdmin    = "is_admin"
    case createdAt  = "created_at"
    case updatedAt  = "updated_at"
    case userId     = "user_id"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    id         = try values.decodeIfPresent(Int.self    , forKey: .id         )
    name       = try values.decodeIfPresent(String.self , forKey: .name       )
    slug       = try values.decodeIfPresent(String.self , forKey: .slug       )
    type       = try values.decodeIfPresent(String.self , forKey: .type       )
    pId        = try values.decodeIfPresent(String.self , forKey: .pId        )
    featured   = try values.decodeIfPresent(Int.self    , forKey: .featured   )
    menuStatus = try values.decodeIfPresent(Int.self    , forKey: .menuStatus )
    isAdmin    = try values.decodeIfPresent(Int.self    , forKey: .isAdmin    )
    createdAt  = try values.decodeIfPresent(String.self , forKey: .createdAt  )
    updatedAt  = try values.decodeIfPresent(String.self , forKey: .updatedAt  )
    userId     = try values.decodeIfPresent(Int.self    , forKey: .userId     )
 
  }

  init() {

  }

}

