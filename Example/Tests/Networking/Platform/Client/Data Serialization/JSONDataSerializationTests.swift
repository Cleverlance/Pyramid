//
//  JSONDataSerializationTests.swift
//  Creditas
//
//  Created by Ondrej Fabian on 16/12/15.
//  Copyright © 2015 Cleverlance. All rights reserved.
//

import XCTest
@testable import Pyramid

class JSONDataSerializationTests: XCTestCase {

    let serialization: DataSerialization = JSONDataSerialization(logger: TestLogger())

    func testSerializationOk() {

        let testString = "{\"good\":\"data\"}"

        let data = testString.data(using: String.Encoding.utf8)!

        let dictionary = (try? serialization.deserializeData(data) as? [String:String]) ?? nil

        XCTAssertNotNil(dictionary)
        XCTAssertEqual(dictionary?["good"], "data")
    }

    func testSerializationThrow() {

        let testString = "💩data"

        let data = testString.data(using: String.Encoding.utf8)!

        do {
            _ = try serialization.deserializeData(data)
            XCTFail()
        } catch DataSerializationError.serializationError {
            // Ok
        } catch {
            XCTFail()
        }

    }

}
