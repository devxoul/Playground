//
//  AppDelegate.swift
//  MyApp
//
//  Created by Suyeol Jeon on 23/06/2019.
//  Copyright © 2019 Suyeol Jeon. All rights reserved.
//

import UIKit
import SnapKit

class AppDelegate: UIResponder, UIApplicationDelegate {

  private let dependency: AppDependency

  var window: UIWindow?

  private override init() {
    self.dependency = AppDependency.resolve()
    super.init()
  }

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    let window = UIWindow(frame: UIScreen.main.bounds)
    window.backgroundColor = .white
    window.makeKeyAndVisible()
    window.rootViewController = HelloViewController(helloService: self.dependency.helloService)
    self.window = window
    return true
  }
}
