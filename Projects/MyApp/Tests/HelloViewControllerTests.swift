//
//  HelloViewControllerTests.swift
//  MyAppTests
//
//  Created by Suyeol Jeon on 23/06/2019.
//

import Combine
import XCTest
import MyServices
@testable import MyApp

final class HelloViewControllerTests: XCTestCase {
  func testLabel() {
    // given
    let helloService = HelloServiceStub()
    helloService.stubbedValue = "Awesome!"

    // when
    let viewController = HelloViewController(helloService: helloService)
    viewController.loadViewIfNeeded()

    // then
    XCTAssertEqual(viewController.label.text, "Awesome!")
  }
}

private class HelloServiceStub: HelloServiceProtocol {
  var stubbedValue: String?

  func hello() -> AnyPublisher<String, Never> {
    return Publishers.Just(self.stubbedValue ?? "").eraseToAnyPublisher()
  }
}
