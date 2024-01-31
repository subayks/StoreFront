//
//  ProductsModel.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 30/01/24.
//

import Foundation

struct ProductsModel: Codable {

  var posts      : Posts?   = Posts()
  var src        : String?  = nil
  var type       : Int?     = nil
  var actives    : Int?     = nil
  var drafts     : Int?     = nil
  var incomplete : Int?     = nil
  var trash      : Int?     = nil
  var request    : Request? = Request()

  enum CodingKeys: String, CodingKey {

    case posts      = "posts"
    case src        = "src"
    case type       = "type"
    case actives    = "active"
    case drafts     = "drafts"
    case incomplete = "incomplete"
    case trash      = "trash"
    case request    = "requests"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    posts      = try values.decodeIfPresent(Posts.self   , forKey: .posts      )
    src        = try values.decodeIfPresent(String.self  , forKey: .src        )
    type       = try values.decodeIfPresent(Int.self     , forKey: .type       )
    actives    = try values.decodeIfPresent(Int.self     , forKey: .actives    )
    drafts     = try values.decodeIfPresent(Int.self     , forKey: .drafts     )
    incomplete = try values.decodeIfPresent(Int.self     , forKey: .incomplete )
    trash      = try values.decodeIfPresent(Int.self     , forKey: .trash      )
    request    = try values.decodeIfPresent(Request.self , forKey: .request    )
 
  }

  init() {

  }

}

struct Posts: Codable {

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

struct PostsItem: Codable {

  var id              : Int?      = nil
  var title           : String?   = nil
  var slug            : String?   = nil
  var userId          : Int?      = nil
  var status          : Int?      = nil
  var featured        : Int?      = nil
  var type            : String?   = nil
  var isAdmin         : Int?      = nil
  var createdAt       : String?   = nil
  var updatedAt       : String?   = nil
  var serviceLocation : String?   = nil
  var serviceType     : String?   = nil
  var youtubeLink     : String?   = nil
  var question1       : String?   = nil
  var question2       : String?   = nil
  var question3       : String?   = nil
  var question4       : String?   = nil
  var question5       : String?   = nil
  var answer1         : String?   = nil
  var answer2         : String?   = nil
  var answer3         : String?   = nil
  var answer4         : String?   = nil
  var answer5         : String?   = nil
  var formateDate     : String?   = nil
  var orderCount      : Int?      = nil
  var preview         : PreviewImageModel?   = nil
  var price           : Price?    = Price()
  var affiliate       : String?   = nil
  var medias          : [Medias]? = []
  var content         : Content?  = Content()
  var categories      : [Category]? = []
  var brands          : [String]? = []
  var seo             : Seo?      = Seo()
  var options         : [String]? = []
  var stock           : Stock?    = Stock()

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
    case formateDate     = "formate_date"
    case orderCount      = "order_count"
    case preview         = "preview"
    case price           = "price"
    case affiliate       = "affiliate"
    case medias          = "medias"
    case content         = "content"
    case categories      = "categories"
    case brands          = "brands"
    case seo             = "seo"
    case options         = "options"
    case stock           = "stock"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    id              = try values.decodeIfPresent(Int.self      , forKey: .id              )
    title           = try values.decodeIfPresent(String.self   , forKey: .title           )
    slug            = try values.decodeIfPresent(String.self   , forKey: .slug            )
    userId          = try values.decodeIfPresent(Int.self      , forKey: .userId          )
    status          = try values.decodeIfPresent(Int.self      , forKey: .status          )
    featured        = try values.decodeIfPresent(Int.self      , forKey: .featured        )
    type            = try values.decodeIfPresent(String.self   , forKey: .type            )
    isAdmin         = try values.decodeIfPresent(Int.self      , forKey: .isAdmin         )
    createdAt       = try values.decodeIfPresent(String.self   , forKey: .createdAt       )
    updatedAt       = try values.decodeIfPresent(String.self   , forKey: .updatedAt       )
    serviceLocation = try values.decodeIfPresent(String.self   , forKey: .serviceLocation )
    serviceType     = try values.decodeIfPresent(String.self   , forKey: .serviceType     )
    youtubeLink     = try values.decodeIfPresent(String.self   , forKey: .youtubeLink     )
    question1       = try values.decodeIfPresent(String.self   , forKey: .question1       )
    question2       = try values.decodeIfPresent(String.self   , forKey: .question2       )
    question3       = try values.decodeIfPresent(String.self   , forKey: .question3       )
    question4       = try values.decodeIfPresent(String.self   , forKey: .question4       )
    question5       = try values.decodeIfPresent(String.self   , forKey: .question5       )
    answer1         = try values.decodeIfPresent(String.self   , forKey: .answer1         )
    answer2         = try values.decodeIfPresent(String.self   , forKey: .answer2         )
    answer3         = try values.decodeIfPresent(String.self   , forKey: .answer3         )
    answer4         = try values.decodeIfPresent(String.self   , forKey: .answer4         )
    answer5         = try values.decodeIfPresent(String.self   , forKey: .answer5         )
    formateDate     = try values.decodeIfPresent(String.self   , forKey: .formateDate     )
    orderCount      = try values.decodeIfPresent(Int.self      , forKey: .orderCount      )
    preview         = try values.decodeIfPresent(PreviewImageModel.self   , forKey: .preview         )
    price           = try values.decodeIfPresent(Price.self    , forKey: .price           )
    affiliate       = try values.decodeIfPresent(String.self   , forKey: .affiliate       )
    medias          = try values.decodeIfPresent([Medias].self , forKey: .medias          )
    content         = try values.decodeIfPresent(Content.self  , forKey: .content         )
    categories      = try values.decodeIfPresent([Category].self , forKey: .categories      )
    brands          = try values.decodeIfPresent([String].self , forKey: .brands          )
    seo             = try values.decodeIfPresent(Seo.self      , forKey: .seo             )
    options         = try values.decodeIfPresent([String].self , forKey: .options         )
    stock           = try values.decodeIfPresent(Stock.self    , forKey: .stock           )
 
  }

  init() {

  }

}

struct Price: Codable {

  var id           : Int?    = nil
  var termId       : Int?    = nil
  var price        : Int?    = nil
  var regularPrice : Int?    = nil
  var specialPrice : Int?    = nil
  var priceType    : Int?    = nil
  var startingDate : String? = nil
  var endingDate   : String? = nil

  enum CodingKeys: String, CodingKey {

    case id           = "id"
    case termId       = "term_id"
    case price        = "price"
    case regularPrice = "regular_price"
    case specialPrice = "special_price"
    case priceType    = "price_type"
    case startingDate = "starting_date"
    case endingDate   = "ending_date"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    id           = try values.decodeIfPresent(Int.self    , forKey: .id           )
    termId       = try values.decodeIfPresent(Int.self    , forKey: .termId       )
    price        = try values.decodeIfPresent(Int.self    , forKey: .price        )
    regularPrice = try values.decodeIfPresent(Int.self    , forKey: .regularPrice )
    specialPrice = try values.decodeIfPresent(Int.self    , forKey: .specialPrice )
    priceType    = try values.decodeIfPresent(Int.self    , forKey: .priceType    )
    startingDate = try values.decodeIfPresent(String.self , forKey: .startingDate )
    endingDate   = try values.decodeIfPresent(String.self , forKey: .endingDate   )
 
  }

  init() {

  }

}

struct Content: Codable {

  var id     : Int?    = nil
  var termId : Int?    = nil
  var key    : String? = nil
  var value  : String? = nil

  enum CodingKeys: String, CodingKey {

    case id     = "id"
    case termId = "term_id"
    case key    = "key"
    case value  = "value"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    id     = try values.decodeIfPresent(Int.self    , forKey: .id     )
    termId = try values.decodeIfPresent(Int.self    , forKey: .termId )
    key    = try values.decodeIfPresent(String.self , forKey: .key    )
    value  = try values.decodeIfPresent(String.self , forKey: .value  )
 
  }

  init() {

  }

}

struct Seo: Codable {

  var id     : Int?    = nil
  var termId : Int?    = nil
  var key    : String? = nil
  var value  : String? = nil

  enum CodingKeys: String, CodingKey {

    case id     = "id"
    case termId = "term_id"
    case key    = "key"
    case value  = "value"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    id     = try values.decodeIfPresent(Int.self    , forKey: .id     )
    termId = try values.decodeIfPresent(Int.self    , forKey: .termId )
    key    = try values.decodeIfPresent(String.self , forKey: .key    )
    value  = try values.decodeIfPresent(String.self , forKey: .value  )
 
  }

  init() {

  }

}

struct Stock: Codable {

  var id          : Int?    = nil
  var termId      : Int?    = nil
  var stockManage : Int?    = nil
  var stockStatus : Int?    = nil
  var stockQty    : Int?    = nil
  var sku         : String? = nil

  enum CodingKeys: String, CodingKey {

    case id          = "id"
    case termId      = "term_id"
    case stockManage = "stock_manage"
    case stockStatus = "stock_status"
    case stockQty    = "stock_qty"
    case sku         = "sku"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    id          = try values.decodeIfPresent(Int.self    , forKey: .id          )
    termId      = try values.decodeIfPresent(Int.self    , forKey: .termId      )
    stockManage = try values.decodeIfPresent(Int.self    , forKey: .stockManage )
    stockStatus = try values.decodeIfPresent(Int.self    , forKey: .stockStatus )
    stockQty    = try values.decodeIfPresent(Int.self    , forKey: .stockQty    )
    sku         = try values.decodeIfPresent(String.self , forKey: .sku         )
 
  }

  init() {

  }

}

struct Request: Codable {

  var attributes : String? = nil
//  var query      : Query?      = Query()
//  var server     : Server?     = Server()
//  var files      : Files?      = Files()
//  var cookies    : Cookies?    = Cookies()
//  var headers    : Headers?    = Headers()

  enum CodingKeys: String, CodingKey {

    case attributes = "attributes"
//    case query      = "query"
//    case server     = "server"
//    case files      = "files"
//    case cookies    = "cookies"
//    case headers    = "headers"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    attributes = try values.decodeIfPresent(String.self , forKey: .attributes )
//    query      = try values.decodeIfPresent(Query.self      , forKey: .query      )
//    server     = try values.decodeIfPresent(Server.self     , forKey: .server     )
//    files      = try values.decodeIfPresent(Files.self      , forKey: .files      )
//    cookies    = try values.decodeIfPresent(Cookies.self    , forKey: .cookies    )
//    headers    = try values.decodeIfPresent(Headers.self    , forKey: .headers    )
 
  }

  init() {

  }

}

struct Links: Codable {

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

struct Category: Codable {

  var id         : Int?    = nil
  var name       : String? = nil
  var slug       : String? = nil
  var type       : String? = nil
  var pId        : Int?    = nil
  var featured   : Int?    = nil
  var menuStatus : Int?    = nil
  var isAdmin    : Int?    = nil
  var createdAt  : String? = nil
  var updatedAt  : String? = nil
  var userId     : Int?    = nil
  var pivot      : Pivot?  = Pivot()

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
    case pivot      = "pivot"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    id         = try values.decodeIfPresent(Int.self    , forKey: .id         )
    name       = try values.decodeIfPresent(String.self , forKey: .name       )
    slug       = try values.decodeIfPresent(String.self , forKey: .slug       )
    type       = try values.decodeIfPresent(String.self , forKey: .type       )
    pId        = try values.decodeIfPresent(Int.self    , forKey: .pId        )
    featured   = try values.decodeIfPresent(Int.self    , forKey: .featured   )
    menuStatus = try values.decodeIfPresent(Int.self    , forKey: .menuStatus )
    isAdmin    = try values.decodeIfPresent(Int.self    , forKey: .isAdmin    )
    createdAt  = try values.decodeIfPresent(String.self , forKey: .createdAt  )
    updatedAt  = try values.decodeIfPresent(String.self , forKey: .updatedAt  )
    userId     = try values.decodeIfPresent(Int.self    , forKey: .userId     )
    pivot      = try values.decodeIfPresent(Pivot.self  , forKey: .pivot      )
 
  }

  init() {

  }

}

struct Pivot: Codable {

  var termId     : Int? = nil
  var categoryId : Int? = nil

  enum CodingKeys: String, CodingKey {

    case termId     = "term_id"
    case categoryId = "category_id"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    termId     = try values.decodeIfPresent(Int.self , forKey: .termId     )
    categoryId = try values.decodeIfPresent(Int.self , forKey: .categoryId )
 
  }

  init() {

  }

}

struct Medias: Codable {

  var id        : Int?    = nil
  var userId    : Int?    = nil
  var name      : String? = nil
  var url       : String? = nil
  var createdAt : String? = nil
  var updatedAt : String? = nil
  var pivot     : MediaPivot?  = MediaPivot()

  enum CodingKeys: String, CodingKey {

    case id        = "id"
    case userId    = "user_id"
    case name      = "name"
    case url       = "url"
    case createdAt = "created_at"
    case updatedAt = "updated_at"
    case pivot     = "pivot"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    id        = try values.decodeIfPresent(Int.self    , forKey: .id        )
    userId    = try values.decodeIfPresent(Int.self    , forKey: .userId    )
    name      = try values.decodeIfPresent(String.self , forKey: .name      )
    url       = try values.decodeIfPresent(String.self , forKey: .url       )
    createdAt = try values.decodeIfPresent(String.self , forKey: .createdAt )
    updatedAt = try values.decodeIfPresent(String.self , forKey: .updatedAt )
    pivot     = try values.decodeIfPresent(MediaPivot.self  , forKey: .pivot     )
 
  }

  init() {

  }

}

struct MediaPivot: Codable {

  var termId  : Int? = nil
  var mediaId : Int? = nil

  enum CodingKeys: String, CodingKey {

    case termId  = "term_id"
    case mediaId = "media_id"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    termId  = try values.decodeIfPresent(Int.self , forKey: .termId  )
    mediaId = try values.decodeIfPresent(Int.self , forKey: .mediaId )
 
  }

  init() {

  }

}

struct PreviewImageModel: Codable {
    
    var id        : Int?    = nil
    var userId    : Int?    = nil
    var name      : String? = nil
    var url       : String? = nil
    var createdAt : String? = nil
    var updatedAt : String? = nil
    var pivot     : PreviewPivot?  = PreviewPivot()
    
    enum CodingKeys: String, CodingKey {
        
        case id        = "id"
        case userId    = "user_id"
        case name      = "name"
        case url       = "url"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case pivot     = "pivot"
        
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        id        = try values.decodeIfPresent(Int.self    , forKey: .id        )
        userId    = try values.decodeIfPresent(Int.self    , forKey: .userId    )
        name      = try values.decodeIfPresent(String.self , forKey: .name      )
        url       = try values.decodeIfPresent(String.self , forKey: .url       )
        createdAt = try values.decodeIfPresent(String.self , forKey: .createdAt )
        updatedAt = try values.decodeIfPresent(String.self , forKey: .updatedAt )
        pivot     = try values.decodeIfPresent(PreviewPivot.self  , forKey: .pivot     )
        
    }
    
    init() {

    }
    
}

struct PreviewPivot: Codable {

  var termId  : Int? = nil
  var mediaId : Int? = nil

  enum CodingKeys: String, CodingKey {

    case termId  = "term_id"
    case mediaId = "media_id"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    termId  = try values.decodeIfPresent(Int.self , forKey: .termId  )
    mediaId = try values.decodeIfPresent(Int.self , forKey: .mediaId )
 
  }

  init() {

  }

}
