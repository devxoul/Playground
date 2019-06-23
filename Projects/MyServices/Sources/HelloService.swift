//
//  HelloService.swift
//  MyApp
//
//  Created by Suyeol Jeon on 23/06/2019.
//

import Foundation
import Combine

import MyUtils

public protocol HelloServiceProtocol {
  func hello() -> AnyPublisher<String, Never>
}

public final class HelloService: HelloServiceProtocol {
  public init() {
  }

  public func hello() -> AnyPublisher<String, Never> {
    return Publishers.Just("hello, world!")
      .map { $0.titlecased() }
      .eraseToAnyPublisher()
  }
}
