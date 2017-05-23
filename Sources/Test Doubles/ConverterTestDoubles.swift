//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

class ConverterDummy<Input, Output: DummyCreatable>: Converter<Input, Output> {
    override func convert(_ input: Input) throws -> Output {
        return Output.dummy
    }
}

class ConverterSpy<Input, Output: DummyCreatable>: Converter<Input, Output> {
    var inputs = [Input]()
    override func convert(_ input: Input) throws -> Output {
        inputs.append(input)
        return Output.dummy
    }
}

class ConverterThrowing<Input, Output>: Converter<Input, Output> {
    override func convert(_ input: Input) throws -> Output {
        throw ConversionError()
    }
}

class ConverterReturning<Input, Output>: Converter<Input, Output> {
    fileprivate let output: Output
    init(_ output: Output) { self.output = output }

    override func convert(_ input: Input) throws -> Output {
        return output
    }
}

class ConverterFake<Input, Output>: Converter<Input, Output> {
    fileprivate let closure: (Input) throws -> Output
    init(_ closure: @escaping (Input) throws -> Output) { self.closure = closure }

    override func convert(_ input: Input) throws -> Output {
        return try closure(input)
    }
}

extension Converter {

    static func returning(_ output: Output) -> Converter<Input, Output> {
        return ConverterReturning(output)
    }

    static func throwing() -> Converter<Input, Output> {
        return ConverterThrowing()
    }

    static func fake(_ closure: @escaping (Input) throws -> Output) -> Converter<Input, Output> {
        return ConverterFake(closure)
    }
}

extension Converter where Output: DummyCreatable {

    static func spy() -> ConverterSpy<Input, Output> {
        return ConverterSpy()
    }

    static func dummy() -> Converter<Input, Output> {
        return ConverterDummy()
    }
}
