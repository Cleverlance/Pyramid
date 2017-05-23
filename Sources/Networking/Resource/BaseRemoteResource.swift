//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

import ObjectMapper

open class BaseRemoteResource<
    Tag,
    Endpoint: RemoteEndpoint,
    RequestModel, RequestDto: Mappable,
    ResponseModel, ResponseDto: Mappable,
    ErrorModel: Error, ErrorDto: Mappable
>: TaggedOperation<RequestModel, ResponseModel, Tag>
/* where Endpoint.Input == RequestModel */ { // FIXME: this causes segfault

    private let client: NetworkClient
    private let config: RemoteResourceConfig
    private let requestConverter: Converter<RequestModel, RequestDto>
    private let responseConverter: Converter<ResponseDto, ResponseModel>
    private let errorConverter: Converter<ErrorDto, ErrorModel>

    public init(
        client: NetworkClient,
        config: RemoteResourceConfig,
        requestConverter: Converter<RequestModel, RequestDto>,
        responseConverter: Converter<ResponseDto, ResponseModel>,
        errorConverter: Converter<ErrorDto, ErrorModel>
    ) {
        self.client = client
        self.config = config
        self.requestConverter = requestConverter
        self.responseConverter = responseConverter
        self.errorConverter = errorConverter
    }

    open override func execute(with request: RequestModel) throws -> ResponseModel {
        let networkRequest = try createNetworkRequest(request)
        let response = try fetchResponseForRequest(networkRequest)

        try checkResponseStatus(response)

        try checkReponseForBusinessError(response)

        return try parseModelFromResponse(response)
    }

    private func parseModelFromResponse(_ response: NetworkResponse) throws -> ResponseModel {
        if let responseDto = Mapper<ResponseDto>().map(JSONObject: response.body),
           let response = try? responseConverter.convert(responseDto) {
            return response
        } else {
            throw JsonConversionError(json: response.body.debugDescription)
        }
    }

    private func checkReponseForBusinessError(_ response: NetworkResponse) throws {
        if let
            errorDto = Mapper<ErrorDto>().map(JSONObject: response.body),
            let error = try? errorConverter.convert(errorDto) {

            throw error
        }
    }

    private func checkResponseStatus(_ response: NetworkResponse) throws {
        if response.status == 401 {
            throw ResourceError.authentication
        }
    }

    open func createNetworkRequest(_ request: RequestModel) throws -> NetworkRequest {
        return NetworkRequest(
            url: config.baseUrl() + Endpoint.path(for: request as! Endpoint.Input),
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
