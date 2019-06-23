//
//  HelloServiceSpec.swift
//  MyApp
//
//  Created by Suyeol Jeon on 23/06/2019.
//

import Nimble
import Quick
import MyServices

final class HelloServiceSpec: QuickSpec {
  override func spec() {
    describe("hello()") {
      it("returns a titlecased greeting phrase") {
        let service = HelloService()
        expect(service.hello()) == "Hello, World!"
      }
    }
  }
}
