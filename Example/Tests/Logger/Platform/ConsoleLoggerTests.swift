//
//  ConsoleLoggerTests.swift
//  Creditas
//
//  Created by Ondrej Fabian on 12/02/16.
//  Copyright © 2016 Cleverlance. All rights reserved.
//

import XCTest
@testable import Pyramid

class ConsoleLoggerTests: XCTestCase {

    func testConsoleLogger() {
        let logger = ConsoleLogger()
        XCTAssertEqual("‼️‼️‼️ERROR:", logger.getLevelPrefix(.error))
        XCTAssertEqual("⚠️⚠️⚠️WARNING:", logger.getLevelPrefix(.warning))
        XCTAssertEqual("ℹ️ℹ️ℹ️INFO:", logger.getLevelPrefix(.info))
        XCTAssertEqual("DEBUG:", logger.getLevelPrefix(.debug))
        logger.log(level: .debug, message: "If you can see this in console, the test passed.")
    }
}
