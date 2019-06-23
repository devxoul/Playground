//
//  String+QuestionTests.swift
//  XcodeGenExample
//
//  Created by Suyeol Jeon on 23/06/2019.
//

import XCTest
import MyUtils

final class StringTitlecasedTests: XCTestCase {
  func testTitlecased() {
    XCTAssertEqual("".titlecased(), "")
    XCTAssertEqual("a".titlecased(), "A")
    XCTAssertEqual("aBC".titlecased(), "A B C")
    XCTAssertEqual("a b".titlecased(), "A B")
    XCTAssertEqual("we're having dinner in the garden".titlecased(), "We're Having Dinner In The Garden")
    XCTAssertEqual("TheSwiftProgrammingLanguage".titlecased(), "The Swift Programming Language")
  }
}
