//
//  Kotoyo.swift
//  Kotoyo
//
//  Created by Shane Vitarana on 12/1/17.
//

import Foundation

public final class Kotoyo {
  private let arguments: [String]
  private let endPointUrl = "https://api.cognitive.microsoft.com/bing/v7.0/images/search"

  public init(arguments: [String] = CommandLine.arguments) {
    guard CommandLine.argc > 2 else {
      fatalError("Incorrect arguments. Usage: API_KEY QUERY [DOWNLOAD_PATH]")
    }

    self.arguments = arguments
  }

  public func run() throws {
    let apiKey = CommandLine.arguments[1]
    let query = CommandLine.arguments[2]
    let path = (CommandLine.argc > 3 ? CommandLine.arguments[3] : "./images")
    let encodedQuery = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!

    let totalPicCount = 150
    let pageCount = 50
    let mkt = "en-US"
    let imageType = "photo"
    let size = "medium"

    let folderName = String(query.characters.map { $0 == " " ? "_" : $0 })
    let downloadPath = "\(path)/\(folderName)/"
    let downloader = Downloader(apiKey: apiKey, downloadPath: downloadPath)

    (0 ..< totalPicCount / pageCount)
      .map { URL(string: "\(endPointUrl)?q=\(encodedQuery)&count=\(pageCount)&offset=\($0 * pageCount)&mkt=\(mkt)&imageType=\(imageType)&size=\(size)")! }
      .map { downloader.fetchImageUrlsTask(forQueryUrl: $0) }
      .forEach { $0.resume() }

    RunLoop.current.run()
  }
}
