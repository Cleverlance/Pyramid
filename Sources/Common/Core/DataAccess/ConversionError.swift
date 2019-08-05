//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

public struct ConversionError: Error {
    public let file: String
    public let line: Int

    public init(file: String = #file, line: Int = #line) {
        self.file = file
        self.line = line
    }
}
