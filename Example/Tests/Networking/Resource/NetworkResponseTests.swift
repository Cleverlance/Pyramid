//
//  NetworkResponseTests.swift
//  Creditas
//
//  Created by Ondrej Fabian on 10/02/16.
//  Copyright © 2016 Cleverlance. All rights reserved.
//

import XCTest
import Pyramid

class NetworkResponseTests: XCTestCase {

    func testResponse() {
        let response = NetworkResponse(status: 0, headers: nil, body: nil)
        XCTAssertNotNil(response)
    }

    func testResponseBodyArrayOk() {
        let response = NetworkResponse(status: 0, headers: nil, body: [1, 2, 3] as ResponseBody)
        XCTAssertNotNil(response.bodyArray)
    }

    func testResponseBodyArrayNok() {
        let response = NetworkResponse(status: 0, headers: nil, body: "string" as ResponseBody)
        XCTAssertNil(response.bodyArray)
    }

    func testResponseBodyDictOk() {
        let response = NetworkResponse(status: 0, headers: nil, body: ["one": 1, "two": 2] as ResponseBody)
        XCTAssertNotNil(response.bodyDictionary)
    }

    func testResponseBodyDictNok() {
        let response = NetworkResponse(status: 0, headers: nil, body: "string" as ResponseBody)
        XCTAssertNil(response.bodyDictionary)
    }
}
