// swiftlint:disable function_body_length

import Quick
import Nimble
import Swinject
import SwinjectAutoregistration
import Pyramid

class SwinjectExtensionsTests: QuickSpec {
    override func spec() {
        describe("registerAsync") {
            var container: Container!
            var spy: OperationSpy<Int, Int, Void>!
            beforeEach {
                spy = IntOperation.spy()
                container = Container()
                container.register(IntOperation.self) { _ in spy }
                container.register(Invoker.self) { _ in InvokerDummy() }
            }

            it("should register command async action") {
                container.registerAsync(IntAsyncOperation.self, with: IntOperation.self)
                let asyncOperation = container.resolve(IntAsyncOperation.self)
                expect(asyncOperation).notTo(beNil())
            }
        }
    }
}

private typealias IntOperation = Pyramid.Operation<Int, Int>
private typealias IntAsyncOperation = AsyncOperation<Int, Int>

private class InvokerDummy: Invoker {
    func enqueue<Command>(command: Command) where Command : CommandType {}
}
