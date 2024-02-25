//
//  OrdersModel.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 01/02/24.
//

import Foundation
struct OrdersModel: Codable {
    
    var orders : Orders? = Orders()
    
    enum CodingKeys: String, CodingKey {
        
        case orders = "orders"
        
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        orders = try values.decodeIfPresent(Orders.self , forKey: .orders )
        
    }
    
    init() {
        
    }
    
}

struct Orders: Codable {
    
    var currentPage  : Int?     = nil
    var data         : [OrdersData]?  = []
    var firstPageUrl : String?  = nil
    var from         : Int?     = nil
    var lastPage     : Int?     = nil
    var lastPageUrl  : String?  = nil
    var links        : [OrderLinks]? = []
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
        data         = try values.decodeIfPresent([OrdersData].self  , forKey: .data         )
        firstPageUrl = try values.decodeIfPresent(String.self  , forKey: .firstPageUrl )
        from         = try values.decodeIfPresent(Int.self     , forKey: .from         )
        lastPage     = try values.decodeIfPresent(Int.self     , forKey: .lastPage     )
        lastPageUrl  = try values.decodeIfPresent(String.self  , forKey: .lastPageUrl  )
        links        = try values.decodeIfPresent([OrderLinks].self , forKey: .links        )
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

struct OrdersData: Codable {
    
    var id            : Int?          = nil
    var orderNo       : String?       = nil
    var transactionId : String?       = nil
    var categoryId    : Int?          = nil
    var customerId    : Int?          = nil
    var userId        : Int?          = nil
    var orderType     : Int?          = nil
    var paymentStatus : Int?          = nil
    var status        : String?       = nil
    var tax           : Int?          = nil
    var shipping      : Int?          = nil
    var total         : Int?          = nil
    var createdAt     : String?       = nil
    var updatedAt     : String?       = nil
    var sDate         : String?       = nil
    var transId       : String?       = nil
    var orderContent  : OrderContent? = OrderContent()
    var order_item_with_file: [OrderFile]? = []
    
    enum CodingKeys: String, CodingKey {
        
        case id            = "id"
        case orderNo       = "order_no"
        case transactionId = "transaction_id"
        case categoryId    = "category_id"
        case customerId    = "customer_id"
        case userId        = "user_id"
        case orderType     = "order_type"
        case paymentStatus = "payment_status"
        case status        = "status"
        case tax           = "tax"
        case shipping      = "shipping"
        case total         = "total"
        case createdAt     = "created_at"
        case updatedAt     = "updated_at"
        case sDate         = "s_date"
        case transId       = "trans_id"
        case orderContent  = "order_content"
        case order_item_with_file = "order_item_with_file"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        id            = try values.decodeIfPresent(Int.self          , forKey: .id            )
        orderNo       = try values.decodeIfPresent(String.self       , forKey: .orderNo       )
        transactionId = try values.decodeIfPresent(String.self       , forKey: .transactionId )
        categoryId    = try values.decodeIfPresent(Int.self          , forKey: .categoryId    )
        customerId    = try values.decodeIfPresent(Int.self          , forKey: .customerId    )
        userId        = try values.decodeIfPresent(Int.self          , forKey: .userId        )
        orderType     = try values.decodeIfPresent(Int.self          , forKey: .orderType     )
        paymentStatus = try values.decodeIfPresent(Int.self          , forKey: .paymentStatus )
        status        = try values.decodeIfPresent(String.self       , forKey: .status        )
        tax           = try values.decodeIfPresent(Int.self          , forKey: .tax           )
        shipping      = try values.decodeIfPresent(Int.self          , forKey: .shipping      )
        total         = try values.decodeIfPresent(Int.self          , forKey: .total         )
        createdAt     = try values.decodeIfPresent(String.self       , forKey: .createdAt     )
        updatedAt     = try values.decodeIfPresent(String.self       , forKey: .updatedAt     )
        sDate         = try values.decodeIfPresent(String.self       , forKey: .sDate         )
        transId       = try values.decodeIfPresent(String.self       , forKey: .transId       )
        orderContent  = try values.decodeIfPresent(OrderContent.self , forKey: .orderContent  )
        order_item_with_file = try values.decodeIfPresent([OrderFile].self , forKey: .order_item_with_file  )
    }
    
    init() {
        
    }
    
}


struct OrderContent: Codable {
    
    var id      : Int?    = nil
    var orderId : Int?    = nil
    var key     : String? = nil
    var value   : String? = nil
    
    enum CodingKeys: String, CodingKey {
        
        case id      = "id"
        case orderId = "order_id"
        case key     = "key"
        case value   = "value"
        
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        id      = try values.decodeIfPresent(Int.self    , forKey: .id      )
        orderId = try values.decodeIfPresent(Int.self    , forKey: .orderId )
        key     = try values.decodeIfPresent(String.self , forKey: .key     )
        value   = try values.decodeIfPresent(String.self , forKey: .value   )
        
    }
    
    init() {
        
    }
    
}

struct OrderLinks: Codable {
    
    var url    : String? = nil
    var label  : String? = nil
    var active : Bool?   = nil
    
    enum CodingKeys: String, CodingKey {
        
        case url    = "url"
        case label  = "label"
        case active = "active"
        
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        url    = try values.decodeIfPresent(String.self , forKey: .url    )
        label  = try values.decodeIfPresent(String.self , forKey: .label  )
        active = try values.decodeIfPresent(Bool.self   , forKey: .active )
        
    }
    
    init() {
        
    }
    
}

struct OrderFile: Codable {
    
    var id      : Int?      = nil
    var orderId : Int?      = nil
    var termId  : Int?      = nil
    var info    : String?   = nil
    var qty     : Int?      = nil
    var amount  : Int?      = nil
    var term    : Term?     = Term()
    var file    : [String]? = []
    var media   : String?   = nil
    
    enum CodingKeys: String, CodingKey {
        
        case id      = "id"
        case orderId = "order_id"
        case termId  = "term_id"
        case info    = "info"
        case qty     = "qty"
        case amount  = "amount"
        case term    = "term"
        case file    = "file"
        case media   = "media"
        
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        id      = try values.decodeIfPresent(Int.self      , forKey: .id      )
        orderId = try values.decodeIfPresent(Int.self      , forKey: .orderId )
        termId  = try values.decodeIfPresent(Int.self      , forKey: .termId  )
        info    = try values.decodeIfPresent(String.self   , forKey: .info    )
        qty     = try values.decodeIfPresent(Int.self      , forKey: .qty     )
        amount  = try values.decodeIfPresent(Int.self      , forKey: .amount  )
        term    = try values.decodeIfPresent(Term.self     , forKey: .term    )
        file    = try values.decodeIfPresent([String].self , forKey: .file    )
        media   = try values.decodeIfPresent(String.self   , forKey: .media   )
        
    }
    
    init() {
        
    }
    
}

struct Term: Codable {

  var id              : Int?    = nil
  var title           : String? = nil
  var slug            : String? = nil
  var userId          : Int?    = nil
  var status          : Int?    = nil
  var featured        : Int?    = nil
  var type            : String? = nil
  var isAdmin         : Int?    = nil
  var createdAt       : String? = nil
  var updatedAt       : String? = nil
  var serviceLocation : String? = nil
  var serviceType     : String? = nil
  var youtubeLink     : String? = nil
  var question1       : String? = nil
  var question2       : String? = nil
  var question3       : String? = nil
  var question4       : String? = nil
  var question5       : String? = nil
  var answer1         : String? = nil
  var answer2         : String? = nil
  var answer3         : String? = nil
  var answer4         : String? = nil
  var answer5         : String? = nil

  enum CodingKeys: String, CodingKey {

    case id              = "id"
    case title           = "title"
    case slug            = "slug"
    case userId          = "user_id"
    case status          = "status"
    case featured        = "featured"
    case type            = "type"
    case isAdmin         = "is_admin"
    case createdAt       = "created_at"
    case updatedAt       = "updated_at"
    case serviceLocation = "service_location"
    case serviceType     = "service_type"
    case youtubeLink     = "youtube_link"
    case question1       = "question1"
    case question2       = "question2"
    case question3       = "question3"
    case question4       = "question4"
    case question5       = "question5"
    case answer1         = "answer1"
    case answer2         = "answer2"
    case answer3         = "answer3"
    case answer4         = "answer4"
    case answer5         = "answer5"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    id              = try values.decodeIfPresent(Int.self    , forKey: .id              )
    title           = try values.decodeIfPresent(String.self , forKey: .title           )
    slug            = try values.decodeIfPresent(String.self , forKey: .slug            )
    userId          = try values.decodeIfPresent(Int.self    , forKey: .userId          )
    status          = try values.decodeIfPresent(Int.self    , forKey: .status          )
    featured        = try values.decodeIfPresent(Int.self    , forKey: .featured        )
    type            = try values.decodeIfPresent(String.self , forKey: .type            )
    isAdmin         = try values.decodeIfPresent(Int.self    , forKey: .isAdmin         )
    createdAt       = try values.decodeIfPresent(String.self , forKey: .createdAt       )
    updatedAt       = try values.decodeIfPresent(String.self , forKey: .updatedAt       )
    serviceLocation = try values.decodeIfPresent(String.self , forKey: .serviceLocation )
    serviceType     = try values.decodeIfPresent(String.self , forKey: .serviceType     )
    youtubeLink     = try values.decodeIfPresent(String.self , forKey: .youtubeLink     )
    question1       = try values.decodeIfPresent(String.self , forKey: .question1       )
    question2       = try values.decodeIfPresent(String.self , forKey: .question2       )
    question3       = try values.decodeIfPresent(String.self , forKey: .question3       )
    question4       = try values.decodeIfPresent(String.self , forKey: .question4       )
    question5       = try values.decodeIfPresent(String.self , forKey: .question5       )
    answer1         = try values.decodeIfPresent(String.self , forKey: .answer1         )
    answer2         = try values.decodeIfPresent(String.self , forKey: .answer2         )
    answer3         = try values.decodeIfPresent(String.self , forKey: .answer3         )
    answer4         = try values.decodeIfPresent(String.self , forKey: .answer4         )
    answer5         = try values.decodeIfPresent(String.self , forKey: .answer5         )
 
  }

  init() {

  }

}
