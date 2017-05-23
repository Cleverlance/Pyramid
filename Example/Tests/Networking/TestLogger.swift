//
//  TestLogger.swift
//  Creditas
//
//  Created by Ondrej Fabian on 14/12/15.
//  Copyright © 2015 Cleverlance. All rights reserved.
//

import Pyramid

class TestLogger: Logger {

    init() { }

    func log(level: LogLevel, message: String) {
        print("\(level) \(message)")
    }
}
