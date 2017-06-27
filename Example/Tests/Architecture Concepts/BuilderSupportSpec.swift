// swiftlint:disable function_body_length

import Quick
import Nimble
import Pyramid
import Result

class BuilderSupportSpec: QuickSpec {
    override func spec() {
        describe("Basic result packing") {
            var first: Result<Int, Error>!
            var second: Result<Int, Error>!

            context("first result is success") { beforeEach { first = .success(1) }
                context("second result is success") { beforeEach { second = .success(2) }
                    it("should pack into tuple") {
                        switch first.pack(second, packedError: { _,_ in Error.zero }) {
                        case .failure: fail()
                        case .success(let value):
                            expect(value.0) == 1
                            expect(value.1) == 2
                        }
                    }
                }
                context("second result is failure") { beforeEach { second = .failure(.two) }
                    it("should fail with second error") {
                        switch first.pack(second, packedError: { _, _ in Error.zero }) {
                        case .failure(let error): expect(error) == Error.two
                        case .success: fail()
                        }
                    }
                }
            }
            context("first result is failure") { beforeEach { first = .failure(.one) }
                context("second result is success") {
                    beforeEach { second = .success(1) }
                    it("should fail with first error") {
                        switch first.pack(second, packedError: { _, _ in Error.zero }) {
                        case .failure(let error): expect(error) == Error.one
                        case .success: fail()
                        }

                    }
                }
                context("second result is failure") { beforeEach { second = .failure(.two) }
                    it("should call packing closure with both errors") {
                        var error1: Error?
                        var error2: Error?
                        _ = first.pack(second) {
                            error1 = $0
                            error2 = $1
                            return Error.zero
                        }
                        expect(error1) == Error.one
                        expect(error2) == Error.two
                    }
                    it("should return error from packing closure") {
                        switch first.pack(second, packedError: { _, _ in Error.zero }) {
                        case .failure(let error): expect(error) == Error.zero
                        case .success: fail()
                        }
                    }
                    context("using packable error") {
                        it("should return error created via packing method") {
                            switch first.pack(second) {
                            case .failure(let error): expect(error) == Error.three
                            case .success: fail()
                            }
                        }
                    }
                }
            }

        }
    }
}

private enum Error: Swift.Error, PackableError {
    case zero, one, two, three

    static func pack(_ first: Error, with second: Error) -> Error {
        return .three
    }
}
