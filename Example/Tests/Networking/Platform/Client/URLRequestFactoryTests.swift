//
//  URLRequestFactoryTests.swift
//  Creditas
//
//  Created by Ondrej Fabian on 16/12/15.
//  Copyright © 2015 Cleverlance. All rights reserved.
//

import XCTest
@testable import Pyramid

class URLRequestFactoryTests: XCTestCase {

    let requestFactory: RequestFactory = URLRequestFactory()

    func testRequestBasic() {

        let testUrlString = "http://url.string.test"
        let testMethod = RequestMethod.get
        let testHeaderFields = RequestHeaders(dictionaryLiteral: ("Test", "Header"))
        let testParams = RequestParameters(dictionaryLiteral: ("test", "json"))
        let testContentType = ContentType.json

        let request = NetworkRequest(url: testUrlString, method: testMethod,
            contentType: testContentType, headers: testHeaderFields, params: testParams)

        let urlRequest = requestFactory.createNSURLRequest(request)

        XCTAssertNotNil(urlRequest.allHTTPHeaderFields)
        XCTAssertNotNil(urlRequest.allHTTPHeaderFields!["Test"])
        XCTAssertNotNil(urlRequest.httpBody)

        XCTAssertEqual(testUrlString, urlRequest.url?.absoluteString)
        XCTAssertEqual("Header", urlRequest.allHTTPHeaderFields!["Test"])
        XCTAssertEqual("*/*", urlRequest.allHTTPHeaderFields!["Accept"])
        XCTAssertEqual("GET", urlRequest.httpMethod)
    }

    func testRequestEmptyBody() {

        let testUrlString = "http://url.string.test"
        let testMethod = RequestMethod.get
        let testContentType = ContentType.json

        let request = NetworkRequest(url: testUrlString, method: testMethod,
            contentType: testContentType, headers: nil, params: nil)

        let urlRequest = requestFactory.createNSURLRequest(request)

        XCTAssertNil(urlRequest.httpBody)
    }

    func testRequestBuildGet() {
        let testMethod = RequestMethod.get
        let testContentType = ContentType.json

        let request = NetworkRequest(url: "http://url.string.test", method: testMethod,
            contentType: testContentType, headers: nil, params: nil)
        let urlRequest = requestFactory.createNSURLRequest(request)

        XCTAssertEqual("GET", urlRequest.httpMethod)
    }

    func testRequestBuildPost() {
        let testMethod = RequestMethod.post
        let testContentType = ContentType.json

        let request = NetworkRequest(url: "http://url.string.test", method: testMethod,
            contentType: testContentType, headers: nil, params: nil)
        let urlRequest = requestFactory.createNSURLRequest(request)

        XCTAssertEqual("POST", urlRequest.httpMethod)
    }

    func testRequestBuildPut() {
        let testMethod = RequestMethod.put
        let testContentType = ContentType.json

        let request = NetworkRequest(url: "http://url.string.test", method: testMethod,
            contentType: testContentType, headers: nil, params: nil)
        let urlRequest = requestFactory.createNSURLRequest(request)

        XCTAssertEqual("PUT", urlRequest.httpMethod)
    }

    func testRequestBuildDelete() {
        let testMethod = RequestMethod.delete
        let testContentType = ContentType.json

        let request = NetworkRequest(url: "http://url.string.test", method: testMethod,
            contentType: testContentType, headers: nil, params: nil)
        let urlRequest = requestFactory.createNSURLRequest(request)

        XCTAssertEqual("DELETE", urlRequest.httpMethod)
    }

    func testRequestContentTypeJSON() {
        let testMethod = RequestMethod.delete
        let testContentType = ContentType.json
        let testParams = RequestParameters(dictionaryLiteral: ("test", "json"))
        let testBody = "{\"test\":\"json\"}"

        let request = NetworkRequest(url: "http://url.string.test", method: testMethod,
            contentType: testContentType, headers: nil, params: testParams)
        let urlRequest = requestFactory.createNSURLRequest(request)

        XCTAssertNotNil(urlRequest.allHTTPHeaderFields!["Content-Type"])
        XCTAssertEqual("application/json; charset=utf-8", urlRequest.allHTTPHeaderFields!["Content-Type"])
        XCTAssertEqual(testBody, String(data: urlRequest.httpBody!, encoding: String.Encoding.utf8))
    }

    func testRequestContentTypeJSONEmptyParameters() {
        let testMethod = RequestMethod.delete
        let testContentType = ContentType.json
        let testParams = RequestParameters()
        let testBody = "{}"

        let request = NetworkRequest(url: "http://url.string.test", method: testMethod,
                                     contentType: testContentType, headers: nil, params: testParams)
        let urlRequest = requestFactory.createNSURLRequest(request)

        XCTAssertNotNil(urlRequest.allHTTPHeaderFields!["Content-Type"])
        XCTAssertEqual("application/json; charset=utf-8", urlRequest.allHTTPHeaderFields!["Content-Type"])
        XCTAssertEqual(testBody, String(data: urlRequest.httpBody!, encoding: String.Encoding.utf8))
    }

    func testRequestContentTypeWWWFromUrlEncoded() {
        let testMethod = RequestMethod.delete
        let testContentType = ContentType.wwwFormUrlEncoded
        let testParams = RequestParameters(dictionaryLiteral: ("test", "url"))
        let testBody = "test=url&"

        let request = NetworkRequest(url: "http://url.string.test", method: testMethod,
            contentType: testContentType, headers: nil, params: testParams)
        let urlRequest = requestFactory.createNSURLRequest(request)

        XCTAssertNotNil(urlRequest.allHTTPHeaderFields!["Content-Type"])
        XCTAssertEqual("application/x-www-form-urlencoded",
            urlRequest.allHTTPHeaderFields!["Content-Type"])
        XCTAssertEqual(testBody, String(data: urlRequest.httpBody!, encoding: String.Encoding.utf8))
    }
}
