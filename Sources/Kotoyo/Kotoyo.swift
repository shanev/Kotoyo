//
//  Kotoyo.swift
//  Kotoyo
//
//  Created by Shane Vitarana on 12/1/17.
//

import Foundation

public final class Kotoyo {
  private let arguments: [String]

  public init(arguments: [String] = CommandLine.arguments) {
    self.arguments = arguments
  }

  public func run() throws {
    print("Hello world")
  }
}
