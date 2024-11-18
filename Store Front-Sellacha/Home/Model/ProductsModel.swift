//
//  ProductsModel.swift
//  Store Front-Sellacha
//
//  Created by Subaykala on 30/01/24.
//

import Foundation

struct ProductsModel: Codable {

  var getRandomProducts     : [PostsItem]?     = []
  var getTrendingProducts   : [PostsItem]?   = []
  var getBestSellingProduct : [PostsItem]? = []

  enum CodingKeys: String, CodingKey {

    case getRandomProducts     = "get_random_products"
    case getTrendingProducts   = "get_trending_products"
    case getBestSellingProduct = "get_best_selling_product"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    getRandomProducts     = try values.decodeIfPresent([PostsItem].self     , forKey: .getRandomProducts     )
    getTrendingProducts   = try values.decodeIfPresent([PostsItem].self   , forKey: .getTrendingProducts   )
    getBestSellingProduct = try values.decodeIfPresent([PostsItem].self , forKey: .getBestSellingProduct )
 
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
    var affilId         : String?   = nil
    var prvideo         : String?   = nil
    var reviewsCount    : Int?      = nil
    var preview         : PreviewModel?  = PreviewModel()
    var attributes      : [String]? = []
    var medias          : [Medias]? = []
    var price           : Price?    = Price()
    var stock           : Stock?    = Stock()
    var affiliate       : String?   = nil
    var categories      : [Categories]? = []

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
      case youtubeLink     = "youtube_links"
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
      case affilId         = "affil_id"
      case prvideo         = "prvideo"
      case reviewsCount    = "reviews_count"
      case preview         = "preview"
      case attributes      = "attributes"
      case medias          = "medias"
      case price           = "price"
      case stock           = "stock"
      case affiliate       = "affiliate"
     case categories      = "categories"

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
      affilId         = try values.decodeIfPresent(String.self   , forKey: .affilId         )
      prvideo         = try values.decodeIfPresent(String.self   , forKey: .prvideo         )
      reviewsCount    = try values.decodeIfPresent(Int.self      , forKey: .reviewsCount    )
      preview         = try values.decodeIfPresent(PreviewModel.self  , forKey: .preview         )
      attributes      = try values.decodeIfPresent([String].self , forKey: .attributes      )
      medias          = try values.decodeIfPresent([Medias].self , forKey: .medias          )
      price           = try values.decodeIfPresent(Price.self    , forKey: .price           )
      stock           = try values.decodeIfPresent(Stock.self    , forKey: .stock           )
      affiliate       = try values.decodeIfPresent(String.self   , forKey: .affiliate       )
      categories      = try values.decodeIfPresent([Categories].self , forKey: .categories      )

   
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


struct Medias: Codable {

  var id        : Int?    = nil
  var userId    : Int?    = nil
  var name      : String? = nil
  var url       : String? = nil
  var createdAt : String? = nil
  var updatedAt : String? = nil
  var pivot     : Pivot?  = Pivot()

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
    pivot     = try values.decodeIfPresent(Pivot.self  , forKey: .pivot     )
 
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
    var pivot     : PreviewModel?  = PreviewModel()
    
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
        pivot     = try values.decodeIfPresent(PreviewModel.self  , forKey: .pivot     )
        
    }
    
    init() {

    }
    
}

struct PreviewModel: Codable {

  var mediaId : Int?   = nil
  var termId  : Int?   = nil
  var media   : Media? = Media()

  enum CodingKeys: String, CodingKey {

    case mediaId = "media_id"
    case termId  = "term_id"
    case media   = "media"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    mediaId = try values.decodeIfPresent(Int.self   , forKey: .mediaId )
    termId  = try values.decodeIfPresent(Int.self   , forKey: .termId  )
    media   = try values.decodeIfPresent(Media.self , forKey: .media   )
 
  }

  init() {

  }

}

struct Categories: Codable {

  var id          : Int?    = nil
  var name        : String? = nil
  var slug        : String? = nil
  var type        : String? = nil
  var pId         : Int?    = nil
  var featured    : Int?    = nil
  var menuStatus  : Int?    = nil
  var isAdmin     : Int?    = nil
  var createdAt   : String? = nil
  var updatedAt   : String? = nil
  var userId      : Int?    = nil
  var sId         : String? = nil
  var imgtype     : String? = nil
  var mainTag     : String? = nil
  var subTag      : String? = nil
  var childTag    : String? = nil
  var nameTag     : String? = nil
  var title       : String? = nil
  var description : String? = nil
  var pivot       : Pivot?  = Pivot()

  enum CodingKeys: String, CodingKey {

    case id          = "id"
    case name        = "name"
    case slug        = "slug"
    case type        = "type"
    case pId         = "p_id"
    case featured    = "featured"
    case menuStatus  = "menu_status"
    case isAdmin     = "is_admin"
    case createdAt   = "created_at"
    case updatedAt   = "updated_at"
    case userId      = "user_id"
    case sId         = "s_id"
    case imgtype     = "imgtype"
    case mainTag     = "main_tag"
    case subTag      = "sub_tag"
    case childTag    = "child_tag"
    case nameTag     = "name_tag"
    case title       = "title"
    case description = "description"
    case pivot       = "pivot"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    id          = try values.decodeIfPresent(Int.self    , forKey: .id          )
    name        = try values.decodeIfPresent(String.self , forKey: .name        )
    slug        = try values.decodeIfPresent(String.self , forKey: .slug        )
    type        = try values.decodeIfPresent(String.self , forKey: .type        )
    pId         = try values.decodeIfPresent(Int.self    , forKey: .pId         )
    featured    = try values.decodeIfPresent(Int.self    , forKey: .featured    )
    menuStatus  = try values.decodeIfPresent(Int.self    , forKey: .menuStatus  )
    isAdmin     = try values.decodeIfPresent(Int.self    , forKey: .isAdmin     )
    createdAt   = try values.decodeIfPresent(String.self , forKey: .createdAt   )
    updatedAt   = try values.decodeIfPresent(String.self , forKey: .updatedAt   )
    userId      = try values.decodeIfPresent(Int.self    , forKey: .userId      )
    sId         = try values.decodeIfPresent(String.self , forKey: .sId         )
    imgtype     = try values.decodeIfPresent(String.self , forKey: .imgtype     )
    mainTag     = try values.decodeIfPresent(String.self , forKey: .mainTag     )
    subTag      = try values.decodeIfPresent(String.self , forKey: .subTag      )
    childTag    = try values.decodeIfPresent(String.self , forKey: .childTag    )
    nameTag     = try values.decodeIfPresent(String.self , forKey: .nameTag     )
    title       = try values.decodeIfPresent(String.self , forKey: .title       )
    description = try values.decodeIfPresent(String.self , forKey: .description )
    pivot       = try values.decodeIfPresent(Pivot.self  , forKey: .pivot       )
 
  }

  init() {

  }

}

struct Media: Codable {

  var id  : Int?    = nil
  var url : String? = nil

  enum CodingKeys: String, CodingKey {

    case id  = "id"
    case url = "url"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    id  = try values.decodeIfPresent(Int.self    , forKey: .id  )
    url = try values.decodeIfPresent(String.self , forKey: .url )
 
  }

  init() {

  }

}


struct Pivot: Codable {

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
