//
//  LoggerTests.swift
//  Creditas
//
//  Created by Ondrej Fabian on 10/02/16.
//  Copyright © 2016 Cleverlance. All rights reserved.
//

import XCTest
import Nimble
import Pyramid

class LoggerTests: XCTestCase {

    func testErrorText() {
        let logger = LoggerSpy()

        logger.error("")

        expect { logger.errorCalledCount } == 1
        expect { logger.warningCalledCount } == 0
        expect { logger.infoCalledCount } == 0
        expect { logger.debugCalledCount } == 0
    }

    func testError() {
        let logger = LoggerSpy()

        logger.error(TestError())

        expect { logger.errorCalledCount } == 1
        expect { logger.warningCalledCount } == 0
        expect { logger.infoCalledCount } == 0
        expect { logger.debugCalledCount } == 0
    }

    func testWarning() {
        let logger = LoggerSpy()

        logger.warning("")

        expect { logger.errorCalledCount } == 0
        expect { logger.warningCalledCount } == 1
        expect { logger.infoCalledCount } == 0
        expect { logger.debugCalledCount } == 0
    }

    func testInfo() {
        let logger = LoggerSpy()

        logger.info("")

        expect { logger.errorCalledCount } == 0
        expect { logger.warningCalledCount } == 0
        expect { logger.infoCalledCount } == 1
        expect { logger.debugCalledCount } == 0
    }

    func testDebug() {
        let logger = LoggerSpy()

        logger.debug("")

        expect { logger.errorCalledCount } == 0
        expect { logger.warningCalledCount } == 0
        expect { logger.infoCalledCount } == 0
        expect { logger.debugCalledCount } == 1
    }
}
