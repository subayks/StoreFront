//
//  SearchModel.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 25/02/24.
//

import Foundation
struct SearchModel: Codable {
    
    var currentPage  : Int?     = nil
    var data         : [PostsItem]?  = []
    var firstPageUrl : String?  = nil
    var from         : Int?     = nil
    var lastPage     : Int?     = nil
    var lastPageUrl  : String?  = nil
    var links        : [Links]? = []
    var nextPageUrl  : String?  = nil
    var path         : String?  = nil
    var perPage      : Int?     = nil
    var prevPageUrl  : String?  = nil
    var to           : Int?     = nil
    var total        : Int?     = nil

    enum CodingKeys: String, CodingKey {

      case currentPage  = "current_page"
      case data         = "data"
      case firstPageUrl = "first_page_url"
      case from         = "from"
      case lastPage     = "last_page"
      case lastPageUrl  = "last_page_url"
      case links        = "links"
      case nextPageUrl  = "next_page_url"
      case path         = "path"
      case perPage      = "per_page"
      case prevPageUrl  = "prev_page_url"
      case to           = "to"
      case total        = "total"
    
    }

    init(from decoder: Decoder) throws {
      let values = try decoder.container(keyedBy: CodingKeys.self)

      currentPage  = try values.decodeIfPresent(Int.self     , forKey: .currentPage  )
      data         = try values.decodeIfPresent([PostsItem].self  , forKey: .data         )
      firstPageUrl = try values.decodeIfPresent(String.self  , forKey: .firstPageUrl )
      from         = try values.decodeIfPresent(Int.self     , forKey: .from         )
      lastPage     = try values.decodeIfPresent(Int.self     , forKey: .lastPage     )
      lastPageUrl  = try values.decodeIfPresent(String.self  , forKey: .lastPageUrl  )
      links        = try values.decodeIfPresent([Links].self , forKey: .links        )
      nextPageUrl  = try values.decodeIfPresent(String.self  , forKey: .nextPageUrl  )
      path         = try values.decodeIfPresent(String.self  , forKey: .path         )
      perPage      = try values.decodeIfPresent(Int.self     , forKey: .perPage      )
      prevPageUrl  = try values.decodeIfPresent(String.self  , forKey: .prevPageUrl  )
      to           = try values.decodeIfPresent(Int.self     , forKey: .to           )
      total        = try values.decodeIfPresent(Int.self     , forKey: .total        )
   
    }

    init() {

    }

  }
