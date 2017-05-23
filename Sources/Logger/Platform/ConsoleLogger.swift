//
//  Copyright © 2015 Cleverlance. All rights reserved.
//

import Foundation

internal final class ConsoleLogger: Logger {

    func log(level: LogLevel, message: String) {
        NSLog("%@ %@\n\n", getLevelPrefix(level), message)
    }

    internal func getLevelPrefix(_ level: LogLevel) -> String {
        switch level {
        case .error:
            return "‼️‼️‼️ERROR:"
        case .warning:
            return "⚠️⚠️⚠️WARNING:"
        case .info:
            return "ℹ️ℹ️ℹ️INFO:"
        case .debug:
            return "DEBUG:"
        }
    }
}
