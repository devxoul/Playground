//
//  HelloServiceSpec.swift
//  MyApp
//
//  Created by Suyeol Jeon on 23/06/2019.
//

import Combine
import Nimble
import Quick
import MyServices

final class HelloServiceSpec: QuickSpec {
  override func spec() {
    describe("hello()") {
      it("emits a titlecased greeting phrase") {
        // given
        let service = HelloService()
        var receivedValue: String?

        // when
        let subscription = service.hello().sink { value in receivedValue = value }

        // then
        expect(receivedValue) == "Hello, World!"
        subscription.cancel()
      }
    }
  }
}
