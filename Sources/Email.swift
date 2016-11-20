// MARK: Email
extension Validator
{
    public struct EmailOptions: OptionSet {
        public let rawValue: Int
        public init(rawValue: Int) { self.rawValue = rawValue }
        
        
        public static let allowDisplayName     = EmailOptions(rawValue: 1 << 0)
        public static let allowNonTLD          = EmailOptions(rawValue: 1 << 1)
        public static let allowUtf8LocalPart   = EmailOptions(rawValue: 1 << 2)
    }
    
    struct EmailPattern {
        static let displayName          = "^[a-z\\d!#\\$%&'\\*\\+\\-\\/=\\?\\^_`{\\|}~\\.\\u00A0-\\uD7FF\\uF900-\\uFDCF\\uFDF0-\\uFFEF]+[a-z\\d!#\\$%&'\\*\\+\\-\\/=\\?\\^_`{\\|}~\\.\\u00A0-\\uD7FF\\uF900-\\uFDCF\\uFDF0-\\uFFEF\\s]*<(.+)>$"
        static let emailUserPart        = "^[a-z\\d!#\\$%&'\\*\\+\\-\\/=\\?\\^_`{\\|}~]+$"
        static let quotedEmailUser      = "^([\\s\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x7f\\x21\\x23-\\x5b\\x5d-\\x7e]|(\\\\[\\x01-\\x09\\x0b\\x0c\\x0d-\\x7f]))*$"
        static let emailUserUtf8Part    = "^[a-z\\d!#\\$%&'\\*\\+\\-\\/=\\?\\^_`{\\|}~\\u00A0-\\uD7FF\\uF900-\\uFDCF\\uFDF0-\\uFFEF]+$"
        static let quotedEmailUserUtf8  = "^([\\s\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x7f\\x21\\x23-\\x5b\\x5d-\\x7e\\u00A0-\\uD7FF\\uF900-\\uFDCF\\uFDF0-\\uFFEF]|(\\\\[\\x01-\\x09\\x0b\\x0c\\x0d-\\x7f\\u00A0-\\uD7FF\\uF900-\\uFDCF\\uFDF0-\\uFFEF]))*$"
    }
    
    public class func isEmail(_ str: String, options: EmailOptions = [.allowUtf8LocalPart]) -> Bool {
        var str = str
        
        if options.contains(.allowDisplayName) {
            if let displayName = firstMatch(input: str, pattern: EmailPattern.displayName, options: .caseInsensitive) {
                str = displayName
            }
        }
        
        var parts = str.components(separatedBy: "@")
        guard parts.count >= 2, let domain = parts.popLast() else {
            return false
        }
        
        var user = parts.joined(separator: "@")
        
        let lowerDomain = domain.lowercased()
        if lowerDomain == "gmail.com" || lowerDomain == "googlemail.com" {
            // With gmail, dots are ignored
            user = user.replacingOccurrences(of: ".", with: "")
        }
        
        guard isByteLength(str: user, option: .max(64)) && isByteLength(str: domain, option: .max(256)) else {
            return false
        }
        
        guard isFQDN(domain, requiredTLD: !options.contains(.allowNonTLD)) else {
            return false
        }
        
        if user.hasPrefix("\"") && user.hasSuffix("\"") {
            user = user.substring(with: user.index(after: user.startIndex)..<user.index(before: user.endIndex))
            return options.contains(.allowUtf8LocalPart) ?
                isMatch(input: user, pattern: EmailPattern.quotedEmailUserUtf8, options: .caseInsensitive) :
                isMatch(input: user, pattern: EmailPattern.quotedEmailUser, options: .caseInsensitive)
        }
        
        let pattern = options.contains(.allowUtf8LocalPart) ? EmailPattern.emailUserUtf8Part : EmailPattern.emailUserPart
        let userParts = user.components(separatedBy: ".")
        for userPart in userParts {
            guard isMatch(input: userPart, pattern: pattern, options: .caseInsensitive) else {
                return false
            }
        }
        
        return true
    }
}
