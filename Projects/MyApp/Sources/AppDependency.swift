//
//  AppDependency.swift
//  MyApp
//
//  Created by Suyeol Jeon on 23/06/2019.
//

import MyServices

struct AppDependency {
  let helloService: HelloServiceProtocol
}

extension AppDependency {
  static func resolve() -> AppDependency {
    return .init(
      helloService: HelloService()
    )
  }
}
