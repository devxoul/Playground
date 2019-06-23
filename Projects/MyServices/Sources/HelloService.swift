//
//  HelloService.swift
//  MyApp
//
//  Created by Suyeol Jeon on 23/06/2019.
//

import Foundation

import MyUtils

public protocol HelloServiceProtocol {
  func hello() -> String
}

public final class HelloService: HelloServiceProtocol {
  public init() {
  }

  public func hello() -> String {
    return "hello, world!".titlecased()
  }
}
