//
//  UserInfoModel.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 02/02/24.
//

import Foundation
struct UserInfoModel: Codable {

  var check : Check? = Check()

  enum CodingKeys: String, CodingKey {

    case check = "check"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    check = try values.decodeIfPresent(Check.self , forKey: .check )
 
  }

  init() {

  }

}

struct Check: Codable {

  var id         : Int?    = nil
  var name       : String? = nil
  var email      : String? = nil
  var domainId   : Int?    = nil
  var createdBy  : Int?    = nil
  var createdAt  : String? = nil
  var updatedAt  : String? = nil
  var mobile     : String? = nil
  var deactivate : Int?    = nil

  enum CodingKeys: String, CodingKey {

    case id         = "id"
    case name       = "name"
    case email      = "email"
    case domainId   = "domain_id"
    case createdBy  = "created_by"
    case createdAt  = "created_at"
    case updatedAt  = "updated_at"
    case mobile     = "mobile"
    case deactivate = "deactivate"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    id         = try values.decodeIfPresent(Int.self    , forKey: .id         )
    name       = try values.decodeIfPresent(String.self , forKey: .name       )
    email      = try values.decodeIfPresent(String.self , forKey: .email      )
    domainId   = try values.decodeIfPresent(Int.self    , forKey: .domainId   )
    createdBy  = try values.decodeIfPresent(Int.self    , forKey: .createdBy  )
    createdAt  = try values.decodeIfPresent(String.self , forKey: .createdAt  )
    updatedAt  = try values.decodeIfPresent(String.self , forKey: .updatedAt  )
    mobile     = try values.decodeIfPresent(String.self , forKey: .mobile     )
    deactivate = try values.decodeIfPresent(Int.self    , forKey: .deactivate )
 
  }

  init() {

  }

}
