//
//  Codable.swift
//  Kotoyo
//
//  Created by Shane Vitarana on 11/9/17.
//  Copyright © 2017 Shane Vitarana. All rights reserved.
//

import Foundation

//{ "statusCode": 429, "message": "Rate limit is exceeded. Try again in 1 seconds." }

struct Error: Decodable {
  let statusCode: Int
  let message: String
}

//{
//    "_type": "Images",
//    "instrumentation": {
//        "pingUrlBase": "https://www.bingapis.com/api/ping?IG=08FFB177A90A4DF585A703215CEC19AA&CID=070910FF0C0362112C11188E0DD06323&ID=",
//        "pageLoadPingUrl": "https://www.bingapis.com/api/ping/pageload"
//    },
//    "readLink": "https://www.bing.com/api/V7/images/search?q=cats",
//    "webSearchUrl": "https://www.bing.com/images/search?q=cats&FORM=OIIARP",
//    "webSearchUrlPingSuffix": "DevEx,5042.1",
//    "totalEstimatedMatches": 1000,
//    "value": [
//    {
//    "name": "Proxecto Gato: cats wallpapers by bighdwallpapers",
//    "webSearchUrl": "https://www.bing.com/images/search?view=detailv2&FORM=OIIRPO&q=cats&id=DF010D14AC241C0AC39B5EAFD85F8B117825C79B&simid=608001210598098509",
//    "webSearchUrlPingSuffix": "DevEx,5043.1",
//    "thumbnailUrl": "https://tse2.mm.bing.net/th?id=OIP.M42428010d527fc1225757ada9d9a8bccH0&pid=Api",
//    "datePublished": "2012-08-23T12:00:00",
//    "contentUrl": "http://4.bp.blogspot.com/-XkviAtJ1s6Q/T3YFb2RUhDI/AAAAAAAAAVQ/EHomLZlFMKo/s1600/small+cat.jpg",
//    "hostPageUrl": "http://proxectogato.blogspot.com/2012/08/cats-wallpapers-by-bighdwallpapers.html",
//    "hostPageUrlPingSuffix": "DevEx,5006.1",
//    "contentSize": "241661 B",
//    "encodingFormat": "jpeg",
//    "hostPageDisplayUrl": "proxectogato.blogspot.com/2012/08/cats-wallpapers-by...",
//    "width": 1600,
//    "height": 1200,
//    "thumbnail": {
//    "width": 480,
//    "height": 360
//    },
//    "imageInsightsToken": "ccid_QkKAENUn*mid_DF010D14AC241C0AC39B5EAFD85F8B117825C79B*simid_608001210598098509",
//    "insightsSourcesSummary": {
//    "shoppingSourcesCount": 1,
//    "recipeSourcesCount": 0
//    },
//    "imageId": "DF010D14AC241C0AC39B5EAFD85F8B117825C79B",
//    "accentColor": "5A4E46"
//    },
//}

struct Response: Decodable {
  let value: [Value]
}

struct Value: Decodable {
  let name: String
  let contentUrl: String
  let encodingFormat: String
}
