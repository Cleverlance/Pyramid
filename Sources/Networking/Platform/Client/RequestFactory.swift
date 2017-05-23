//
//  Copyright © 2015 Cleverlance. All rights reserved.
//

import Foundation

internal protocol RequestFactory {
    func createNSURLRequest(_ networkRequest: NetworkRequest) -> URLRequest
}

internal final class URLRequestFactory: RequestFactory {

    init() { }

    func createNSURLRequest(_ request: NetworkRequest) -> URLRequest {
        let urlRequest = NSMutableURLRequest()
        urlRequest.url = URL(string: request.url)
        urlRequest.allHTTPHeaderFields = addHeaders(request.headers,
            contentType: request.contentType)
        urlRequest.httpMethod = methodString(request.method)
        urlRequest.httpBody = makeRequestBodyDataIfAnyParams(request.params,
            contentType: request.contentType)
        return urlRequest as URLRequest
    }

    fileprivate func methodString(_ method: RequestMethod) -> String {
        switch method {
        case .get:
            return "GET"
        case .post:
            return "POST"
        case .put:
            return "PUT"
        case .delete:
            return "DELETE"
        }
    }

    fileprivate func addHeaders(_ possibleHeaders: RequestHeaders?, contentType: ContentType)
        -> RequestHeaders {

        var headers = possibleHeaders ?? RequestHeaders()
        headers["Accept"] = "*/*"
        headers["Content-Type"] = contentTypeString(contentType)
        return headers
    }

    fileprivate func contentTypeString(_ contentType: ContentType) -> String {
        switch contentType {
        case .wwwFormUrlEncoded:
            return "application/x-www-form-urlencoded"
        case .json:
            return "application/json; charset=utf-8"
        }
    }

    fileprivate func makeRequestBodyDataIfAnyParams(_ requestParameters: RequestParameters?,
        contentType: ContentType) -> Data? {

        var bodyData: Data?
        if let params = requestParameters {
            let bodyString = makeRequestBodyString(params, contentType: contentType)
            bodyData = encodeBodyString(bodyString)
        }
        return bodyData
    }

    fileprivate func makeRequestBodyString(_ requestParameters: RequestParameters,
        contentType: ContentType) -> String {

        let bodyString: String
        switch contentType {
        case .json:
            bodyString = makeJSONRequestBodyString(requestParameters)
        case .wwwFormUrlEncoded:
            bodyString = makeUrlRequestBodyString(requestParameters)
        }
        return bodyString
    }

    fileprivate func makeUrlRequestBodyString(_ params: RequestParameters) -> String {
        var bodyString = ""
        for (key, value) in params {
            bodyString += "\(key)=\(value)&"
        }
        return bodyString
    }

    fileprivate func makeJSONRequestBodyString(_ params: RequestParameters) -> String {
        // swiftlint:disable force_try
        let data = try! JSONSerialization.data(withJSONObject: params, options: [])
        // swiftlint:enable force_try
        return String(data: data, encoding: String.Encoding.utf8)!
    }

    fileprivate func encodeBodyString(_ bodyString: String) -> Data? {
        let data = bodyString.data(using: String.Encoding.utf8, allowLossyConversion: false)
        return data

    }
}
