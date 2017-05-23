//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

import XCTest
import Nimble
import ObjectMapper
@testable import Pyramid

class BaseRemoteResourceTests: XCTestCase {

    func test_ItConformsToResource() {
        let _: TaggedOperation<Dummy, Dummy, ()>? = (nil as BaseRemoteResource<SomeEndpoint, ()>?)
    }

    func test_makeRequest_ItShouldConvertGivenModelToRequestDto() {
        let spy = Converter<Dummy, Dummy>.spy()
        let resource = resourceWith(requestConverter: spy)

        let _ = try? resource.execute(with: Dummy(42))

        expect(spy.inputs.map { $0.value }) == [42]
    }

    func test_makeRequest_ItShouldMakeRequestWithProperParameters() {
        let spy = NetworkClientSpy()
        let resource = resourceWith(
            client: spy,
            config: RemoteResourceConfigReturning("baseUrl/"),
            requestConverter: .returning(Dummy(42))
        )

        let _ = try? resource.execute(with: Dummy(0))

        expect(spy.requests).to(haveCount(1))
        let request = spy.requests.first

        expect(request?.contentType) == SomeEndpoint.contentType
        expect(request?.headers) == SomeEndpoint.requestHeaders
        expect(request?.method) == SomeEndpoint.method
        expect(request?.url) == "baseUrl/" + SomeEndpoint.path
        expect(request?.params?["key"] as? Int) == 42
    }

    func test_makeRequest_GivenThrowingClient_ItShouldThrowGeneralError() {
        let resource = resourceWith(client: NetworkClientThrowing())
        expect { try resource.execute(with: Dummy(42)) }
            .to(throwError(ResourceError.internalError))
    }

    func test_makeRequest_WhenResponseHasStatus401_ItShouldThrowAuthenticationError() {
        let resource = resourceWith(
            client: NetworkClientReturning(response401)
        )
        expect { try resource.execute(with: Dummy(42)) }
            .to(throwError(ResourceError.authentication))
    }

    func test_GivenClientValidError_GivenErrorConverterReturning42_ItShouldThrowError42() {
        let resource = resourceWith(
            client: NetworkClientReturning(responseValid),
            responseConverter: .throwing(),
            errorConverter: .returning(Dummy(42))
        )

        expect { try resource.execute(with: Dummy(0)) }.to(throwError(Dummy(42)))
    }

    func test_GivenValidResponse_GivenRsponseConverterReturning42_ItShouldReturn42() {
        let resource = resourceWith(
            client: NetworkClientReturning(responseValid),
            responseConverter: .returning(Dummy(42)),
            errorConverter: .throwing()
        )

        let response = try? resource.execute(with: Dummy(0))

        expect(response?.value) == 42
    }

    func test_GivenThrowingResponseAndErrorConverter_ItShouldThrowIncorectResponse() {
        let resource = resourceWith(
            client: NetworkClientReturning(responseValid),
            responseConverter: ConverterThrowing(),
            errorConverter: ConverterThrowing()
        )

        expect { try resource.execute(with: Dummy(0)) }
            .to(throwError(errorType: JsonConversionError.self))
    }

    func test_GivenValidResponseAndError_ItShouldReturnError() {
        let resource = resourceWith(
            client: NetworkClientReturning(responseValid),
            responseConverter: .returning(Dummy(42)),
            errorConverter: .returning(Dummy(42))
        )
        expect { try resource.execute(with: Dummy(0)) }
            .to(throwError())
    }
}

private let response401 = NetworkResponse(status: 401, headers: nil, body: nil)
private let responseValid = NetworkResponse(status: 200, headers: nil, body: ["key": 0] as ResponseBody)

private func resourceWith(
    client: NetworkClient = NetworkClientDummy(),
    config: RemoteResourceConfig = RemoteResourceConfigDummy(),
    requestConverter: Converter<Dummy, Dummy> = .dummy(),
    responseConverter: Converter<Dummy, Dummy> = .dummy(),
    errorConverter: Converter<Dummy, Dummy> = .dummy(),
    logger: Logger = TestLogger()
) -> BaseRemoteResource<SomeEndpoint, ()> {

    return BaseRemoteResource(
        client: client,
        config: config,
        requestConverter: requestConverter,
        responseConverter: responseConverter,
        errorConverter: errorConverter
    )
}

private struct Dummy: Mappable, Error, DummyCreatable {
    var value: Int
    init(_ value: Int) { self.value = value }
    init?(map: Map) { value = 0 }
    mutating func mapping(map: Map) { value <- map["key"] }

    fileprivate static let dummy = Dummy(0)
}

private struct SomeEndpoint: SimpleRemoteEndpoint {
    typealias Input = Dummy
    typealias InputDto = Dummy
    typealias Output = Dummy
    typealias OutputDto = Dummy
    typealias ErrorModel = Dummy
    typealias ErrorDto = Dummy

    static let contentType: ContentType = .json
    static let method: RequestMethod = .get
    static let path: String = "path"
    static let requestHeaders: RequestHeaders? = ["key": "value"]
}
