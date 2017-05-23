//
//  Copyright © 2016 Cleverlance. All rights reserved.
//
// swiftlint:disable line_length
// http://www.swift-studies.com/blog/2014/6/12/regex-matching-and-template-replacement-operators-in-swift

import Foundation

public struct Regex {
    var pattern: String {
        didSet {
            updateRegex()
        }
    }
    var expressionOptions: NSRegularExpression.Options {
        didSet {
            updateRegex()
        }
    }
    var matchingOptions: NSRegularExpression.MatchingOptions

    var regex: NSRegularExpression?

    public init(pattern: String, expressionOptions: NSRegularExpression.Options, matchingOptions: NSRegularExpression.MatchingOptions) {
        self.pattern = pattern
        self.expressionOptions = expressionOptions
        self.matchingOptions = matchingOptions
        updateRegex()
    }

    public init(_ pattern: String) {
        self.pattern = pattern
        expressionOptions = []
        matchingOptions = []
        updateRegex()
    }

    mutating func updateRegex() {
        regex = try? NSRegularExpression(pattern: pattern, options: expressionOptions)
    }
}

// MARK: - String Extensions

extension String {
    public func matchGroups(pattern: Regex) -> [String] {
        let range = NSRange(location: 0, length: characters.count)
        guard let regex = pattern.regex else { return [] }
        guard let match = regex.firstMatch(in: self, options: pattern.matchingOptions, range: range) else { return [] }

        var groups = [String]()
        for index in 1 ..< match.numberOfRanges {
            groups.append((self as NSString).substring(with: match.rangeAt(index)))
        }
        return groups
    }

    func matchRegex(_ pattern: Regex) -> Bool {
        let range = NSRange(location: 0, length: characters.count)
        if pattern.regex != nil {
            let matches: [AnyObject] = pattern.regex!.matches(in: self, options: pattern.matchingOptions, range: range)
            return matches.count > 0
        }
        return false
    }

    func match(patternString: String) -> Bool {
        return self.matchRegex(Regex(patternString))
    }

    func replaceRegex(_ pattern: Regex, template: String) -> String {
        if self.matchRegex(pattern) {
            let range = NSRange(location: 0, length: characters.count)
            if pattern.regex != nil {
                return pattern.regex!.stringByReplacingMatches(in: self, options: pattern.matchingOptions, range: range, withTemplate: template)
            }
        }
        return self
    }

    func replace(pattern: String, template: String) -> String {
        return self.replaceRegex(Regex(pattern), template: template)
    }
}

// MARK: - Operators

infix operator =~

public func =~ (left: String, right: Regex) -> Bool {
    let range = NSRange(location: 0, length: left.characters.count)
    if let regex = right.regex {
        let matches = regex.matches(in: left, options: right.matchingOptions, range: range)
        return matches.count > 0
    }

    return false
}

public func =~ (left: String, right: String) -> Bool {
    return left =~ Regex(right)
}

infix operator ><

public func >< (left: String, right: (regex: Regex, template: String) ) -> String {
    if left =~ right.regex {
        let range = NSRange(location: 0, length: left.characters.count)
        if let regex = right.regex.regex {
            return regex.stringByReplacingMatches(in: left, options: right.regex.matchingOptions, range: range, withTemplate: right.template)
        }
    }
    return left
}

public func >< (left: String, right: (pattern: String, template: String)) -> String {
    return left >< (Regex(right.pattern), right.template)
}
