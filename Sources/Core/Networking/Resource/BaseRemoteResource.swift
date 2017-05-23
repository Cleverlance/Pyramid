//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

import ObjectMapper

open class BaseRemoteResource<Endpoint: RemoteEndpoint, Tag>: TaggedOperation<
    Endpoint.Input, Endpoint.Output, Tag
> {
    private let client: NetworkClient
    private let config: RemoteResourceConfig
    private let requestConverter: Converter<Endpoint.Input, Endpoint.InputDto>
    private let responseConverter: Converter<Endpoint.OutputDto, Endpoint.Output>
    private let errorConverter: Converter<Endpoint.ErrorDto, Endpoint.ErrorModel>

    public init(
        client: NetworkClient,
        config: RemoteResourceConfig,
        requestConverter: Converter<Endpoint.Input, Endpoint.InputDto>,
        responseConverter: Converter<Endpoint.OutputDto, Endpoint.Output>,
        errorConverter: Converter<Endpoint.ErrorDto, Endpoint.ErrorModel>
    ) {
        self.client = client
        self.config = config
        self.requestConverter = requestConverter
        self.responseConverter = responseConverter
        self.errorConverter = errorConverter
    }

    open override func execute(with request: Endpoint.Input) throws -> Endpoint.Output {
        let networkRequest = try createNetworkRequest(request)
        let response = try fetchResponseForRequest(networkRequest)

        try checkResponseStatus(response)

        try checkReponseForBusinessError(response)

        return try parseModelFromResponse(response)
    }

    private func parseModelFromResponse(_ response: NetworkResponse) throws -> Endpoint.Output {
        if let responseDto = Mapper<Endpoint.OutputDto>().map(JSONObject: response.body),
           let response = try? responseConverter.convert(responseDto) {
            return response
        } else {
            throw JsonConversionError(json: response.body.debugDescription)
        }
    }

    private func checkReponseForBusinessError(_ response: NetworkResponse) throws {
        if let
            errorDto = Mapper<Endpoint.ErrorDto>().map(JSONObject: response.body),
            let error = try? errorConverter.convert(errorDto) {

            throw error
        }
    }

    private func checkResponseStatus(_ response: NetworkResponse) throws {
        if response.status == 401 {
            throw ResourceError.authentication
        }
    }

    open func createNetworkRequest(_ request: Endpoint.Input) throws -> NetworkRequest {
        return NetworkRequest(
            url: config.baseUrl() + Endpoint.path(for: request),
            method: Endpoint.method,
            contentType: Endpoint.contentType,
            headers: Endpoint.requestHeaders,
            params: try requestConverter.convert(request).toJSON()
        )
    }

    private func fetchResponseForRequest(_ request: NetworkRequest) throws -> NetworkResponse {
        if let response = try? client.request(request) {
            return response
        } else {
            throw ResourceError.internalError
        }
    }
}
