//
//  Copyright © 2015 Cleverlance. All rights reserved.
//

import Foundation

internal protocol ResponseProcessor {
    func parseResponse(_ responseRawBody: Any?, httpUrlResponse: HTTPURLResponse) throws
        -> NetworkResponse
}

internal final class HTTPURLResponseProcessor: ResponseProcessor {

    func parseResponse(_ responseRawBody: Any?, httpUrlResponse: HTTPURLResponse)
        throws -> NetworkResponse {

        let responseBody = try getBody(responseRawBody)
        let responseHeaders = getHeaderFields(httpUrlResponse.allHeaderFields)
        let response = NetworkResponse(status: httpUrlResponse.statusCode, headers: responseHeaders,
            body: responseBody)
        return response
    }

    fileprivate func getHeaderFields(_ allHeaderFields: [AnyHashable: Any]) -> [String: String] {
        var dict = [String: String]()

        for (key, value) in allHeaderFields {
            // swiftlint:disable force_cast
            dict[key as! String] = value as? String
            // swiftlint:enable force_cast
        }

        return dict
    }

    fileprivate func getBody(_ responseBody: Any?) throws -> Any? {
        if responseBody == nil {
            return nil
        }
        if let array = responseBody as? NSArray {
            return array
        }
        if let dict = responseBody as? [AnyHashable: Any] {
            return getBodyDictionary(dict) as Any?
        }
        if let str = responseBody as? String {
            return str as Any?
        }
        throw ResourceError.incorrectResponse
    }

    fileprivate func getBodyDictionary(_ responseBody: [AnyHashable: Any]) -> [String: Any] {
        var dict = [String: Any]()

        for (key, value) in responseBody {
            // swiftlint:disable force_cast
            dict[key as! String] = value as Any?
            // swiftlint:enable force_cast
        }

        return dict
    }
}
