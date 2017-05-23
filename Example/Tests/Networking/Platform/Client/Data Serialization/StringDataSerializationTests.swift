//
//  StringDataSerializationTests.swift
//  Creditas
//
//  Created by Ondrej Fabian on 12/02/16.
//  Copyright © 2016 Cleverlance. All rights reserved.
//

import XCTest
@testable import Pyramid

class StringDataSerializationTests: XCTestCase {

    let serialization: DataSerialization = StringDataSerialization(logger: TestLogger())

    func testSerializationNok() {

        var myUnsignedInt: UInt = 700
        let data = withUnsafePointer(to: &myUnsignedInt) {
            Data(bytes: UnsafeRawPointer($0), count: MemoryLayout.size(ofValue: myUnsignedInt))
        }

        do {
            _ = try serialization.deserializeData(data) as? String
            XCTFail()
        } catch DataSerializationError.serializationError {
            XCTAssertTrue(true)
        } catch {
            XCTFail()
        }
    }

    func testSerializationOk() {
        let testString = "{\"good\":\"data\"}"

        let data = testString.data(using: String.Encoding.utf8)!

        let string = try? serialization.deserializeData(data)

        XCTAssertNotNil(string)
        XCTAssertEqual(string as? String, "{\"good\":\"data\"}")
    }
}
