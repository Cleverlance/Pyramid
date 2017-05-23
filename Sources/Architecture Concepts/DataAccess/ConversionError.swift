//
//  Copyright © 2016 Cleverlance. All rights reserved.
//

public struct ConversionError {
    let file: String
    let line: Int

    public init(file: String = #file, line: Int = #line) {
        self.file = file
        self.line = line
    }
}
