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
                    container.register(Int.self) { (_, _: Int) in 42 }
                }

                it("should use given registration as factory implementation") {
                    container.registerFactory(IntFactory.self)
                    let factory = container.resolve(IntFactory.self)!
                    expect(factory.make(for: 0)) == 42
                }
            }
        }
    }
}

private extension SwinejctFactoryTests {
    typealias IntFactory = Factory<Int, Int>
}
