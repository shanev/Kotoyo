//
//  Codable.swift
//  Kotoyo
//
//  Created by Shane Vitarana on 11/9/17.
//  Copyright © 2017 Shane Vitarana. All rights reserved.
//

import Foundation

struct Error: Decodable {
  let statusCode: Int
  let message: String
}

struct Response: Decodable {
  let value: [Value]
}

struct Value: Decodable {
  let name: String
  let contentUrl: String
  let encodingFormat: String
}
