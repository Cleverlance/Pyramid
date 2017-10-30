// swiftlint:disable function_body_length

import Quick
import Nimble
import Swinject
import Pyramid

class SwinejctFactoryTests: QuickSpec {
    override func spec() {
        var container: Container!
        beforeEach { container = Container() }

        describe("registerFactory") {
            context("given registration with matching types") {
                beforeEach {
                    container.register(String.self) { "\($0.resolve(Int.self)!)" }
                }

                it("should use given registration as factory implementation") {
                    container.registerFactory(StringFactory.self)
                    let factory = container.resolve(StringFactory.self)!
                    expect(factory.make(for: 42)) == "42"
                }
            }
        }
    }
}

private extension SwinejctFactoryTests {
    typealias StringFactory = Factory<Int, String>
}
