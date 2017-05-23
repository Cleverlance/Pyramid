//
//  LoggerFakes.swift
//  Creditas
//
//  Created by Ondrej Fabian on 25/03/16.
//  Copyright © 2016 Cleverlance. All rights reserved.
//

import Pyramid

open class LoggerSpy: Logger {

    var errorCalledCount = 0
    var warningCalledCount = 0
    var infoCalledCount = 0
    var debugCalledCount = 0

    open func log(level: LogLevel, message: String) {
        switch level {
        case .error:
            errorCalledCount += 1
        case .warning:
            warningCalledCount += 1
        case .info:
            infoCalledCount += 1
        case .debug:
            debugCalledCount += 1
        }
    }
}
