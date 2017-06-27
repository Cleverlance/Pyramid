// swiftlint:disable function_body_length

import Quick
import Nimble
import Pyramid

class CompositeErrorSpec: QuickSpec {
    override func spec() {
        describe("Packable") {
            it("should append partial errors") {
                let result = CompositeError<Error>.pack(CompositeError(.one), with: CompositeError(.two))
                expect(result.parts) == [.one, .two]
            }
        }
    }
}

private enum Error: Swift.Error {
    case one, two
}
