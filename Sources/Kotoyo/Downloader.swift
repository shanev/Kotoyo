//
//  Downloader.swift
//  Kotoyo
//
//  Created by Shane Vitarana on 11/9/17.
//  Copyright © 2017 Shane Vitarana. All rights reserved.
//

import Foundation

public class Downloader {
  let apiKey: String
  let downloadPath: String
  var count = 0
  var dowloadedCount = 0

  init(apiKey: String, downloadPath: String) {
    self.apiKey = apiKey
    self.downloadPath = downloadPath

    do {
      try FileManager.default.createDirectory(atPath: downloadPath, withIntermediateDirectories: false)
      print("Creating \(downloadPath) folder..")
    } catch (let error) {
      print(error);
    }
  }

  func fetchImageUrlsTask(forQueryUrl url:URL) -> URLSessionDataTask {
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    request.setValue(apiKey, forHTTPHeaderField: "Ocp-Apim-Subscription-Key")

    return URLSession(configuration: urlSessionConfig()).dataTask(with: request) { data, response, _ in
      guard let data = data else {
        print(ANSIColors.red + "Error: No data returned.")
        return
      }

      guard (response as? HTTPURLResponse)?.statusCode == 200 else {
        let error: Error = try! JSONDecoder().decode(Error.self, from: data)
        print(ANSIColors.red + "Error \(error.statusCode): \(error.message)")
        return
      }

      print(ANSIColors.green + "Processing \(url.absoluteString)")
      do {
        try JSONDecoder().decode(Response.self, from: data)
          .value
          .map { URL(string: $0.contentUrl)! }
          .filter { $0.pathExtension.count > 0 }
          .forEach { self.downloadFile(at: $0) }
      } catch(let error) {
        print(error)
      }
    }
  }
}

private extension Downloader {
  func downloadFile(at url:URL) {
    print(ANSIColors.blue + "Downloading \(url.lastPathComponent)")
    count += 1
    let filename = "image_\(String(format: "%04d", count)).\(url.pathExtension)"

    URLSession(configuration: urlSessionConfig()).downloadTask(with: url) { downloadedUrl, _, _ in
      self.dowloadedCount += 1
      defer {
        if self.dowloadedCount == self.count {
          exit(0)
        }
      }

      guard let downloadedUrl = downloadedUrl else { return }

      do {
        let fileUrl = URL(fileURLWithPath: self.downloadPath).appendingPathComponent(filename)
        try FileManager.default.copyItem(at: downloadedUrl, to: fileUrl)
        print(ANSIColors.white + "Saving \(filename)...")
      } catch (let error) {
        print(error)
      }
      }.resume()
  }

  func urlSessionConfig() -> URLSessionConfiguration {
    let urlConfig = URLSessionConfiguration.default
    urlConfig.timeoutIntervalForRequest = 10
    urlConfig.timeoutIntervalForResource = 10
    return urlConfig
  }
}

