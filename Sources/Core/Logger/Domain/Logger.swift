//
//  Copyright © 2015 Cleverlance. All rights reserved.
//

public enum LogLevel {
    case error
    case warning
    case info
    case debug
}

public protocol Logger {
    func log(level: LogLevel, message: String)
}

public extension Logger {

    public func error(_ error: Error) {
        log(level: LogLevel.error, message: "\(error)")
    }

    public func error(_ message: String) {
        log(level: LogLevel.error, message: message)
    }

    public func warning(_ message: String) {
        log(level: LogLevel.warning, message: message)
    }

    public func info(_ message: String) {
        log(level: LogLevel.info, message: message)
    }

    public func debug(_ message: String) {
        log(level: LogLevel.debug, message: message)
    }
}
