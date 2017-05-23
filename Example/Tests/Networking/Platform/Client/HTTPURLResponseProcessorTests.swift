//
//  HTTPURLResponseProcessorTests.swift
//  Creditas
//
//  Created by Ondrej Fabian on 16/12/15.
//  Copyright © 2015 Cleverlance. All rights reserved.
//

import XCTest
@testable import Pyramid
import Nimble

class HTTPURLResponseProcessorTests: XCTestCase {

    let responseProcessor: ResponseProcessor = HTTPURLResponseProcessor()

//    let testUrlString = "http://url.string.test"
    let testStatusCode = 200
    let testHTTPVersion = "HTTP/1.1"
    let testHeaderFields = ["Test": "Header"]
    let urlString = "http://url.string.test"

    func testResponse() {
        let url = URL(string: urlString)!
        let urlResponse = HTTPURLResponse(url: url, statusCode: testStatusCode,
            httpVersion: testHTTPVersion, headerFields: testHeaderFields)!
        let testRawBody = [NSString(string: "test"): "json"]

        do {
            let response = try responseProcessor.parseResponse(testRawBody,
                httpUrlResponse: urlResponse)
            XCTAssertEqual(testStatusCode, response.status)
            XCTAssertNotNil(response.headers)
            XCTAssertEqual(testHeaderFields, response.headers!)
            XCTAssertNotNil(response.body)
            XCTAssertNotNil(response.body as? [String: String])
            let responseBody = response.body as? [String: String]
            XCTAssertNotNil(responseBody)
            XCTAssertNotNil(responseBody!["test"])
            XCTAssertEqual("json", responseBody!["test"])
        } catch {
            XCTFail()
        }
    }

    func testBodyArray() {
        let url = URL(string: urlString)!
        let urlResponse = HTTPURLResponse(url: url, statusCode: testStatusCode,
            httpVersion: testHTTPVersion, headerFields: testHeaderFields)!
        let testRawBody = [Any]()
        do {
            let response = try responseProcessor.parseResponse(testRawBody,
                httpUrlResponse: urlResponse)
            XCTAssertNotNil(response)
        } catch {
            XCTFail()
        }
    }

    func testBodyString() {
        let url = URL(string: urlString)!
        let urlResponse = HTTPURLResponse(url: url, statusCode: testStatusCode,
            httpVersion: testHTTPVersion, headerFields: testHeaderFields)!
        let testRawBody = "String"
        do {
            let response = try responseProcessor.parseResponse(testRawBody,
                httpUrlResponse: urlResponse)
            XCTAssertNotNil(response)
        } catch {
            XCTFail()
        }
    }

    func testIncorrectRawBody() {
        let url = URL(string: urlString)!
        let urlResponse = HTTPURLResponse(url: url, statusCode: testStatusCode,
            httpVersion: testHTTPVersion, headerFields: testHeaderFields)!
        let testRawBody = 1
        do {
            _ = try responseProcessor.parseResponse(testRawBody, httpUrlResponse: urlResponse)
            XCTFail()
        } catch ResourceError.incorrectResponse {
            XCTAssertTrue(true)
        } catch {
            XCTFail()
        }
    }

    func test_givenNilBody_ItShouldReturnResponseWitNilBody() {
        let url = URL(string: urlString)!
        let urlResponse = HTTPURLResponse(url: url, statusCode: testStatusCode,
            httpVersion: testHTTPVersion, headerFields: testHeaderFields)!

        let response = try? responseProcessor.parseResponse(nil, httpUrlResponse: urlResponse)

        expect(response).notTo(beNil())
        expect(response?.body).to(beNil())
    }
}
