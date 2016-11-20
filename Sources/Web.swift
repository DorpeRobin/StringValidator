extension Validator
{
    // MARK: Fully Qualified Domain Name
    struct TLDPattern {
        static let topLevelDomain   = "^([a-z\\u00a1-\\uffff]{2,}|xn[a-z0-9-]{2,})$"
        static let webUrl           = "^[a-z\\u00a1-\\uffff0-9-]+$"
        static let fullWidthChar    = "[\\uff01-\\uff5e]"
    }
    
    // Fully Qualified Domain Name
    public class func isFQDN(_ str: String, requiredTLD: Bool = true) -> Bool {
        var parts = str.components(separatedBy: ".")
        
        guard parts.count >= 2 else {
            // Valid domain has at least two parts
            return false
        }
        
        if requiredTLD {
            guard let tld = parts.popLast(), isMatch(input: tld, pattern: TLDPattern.topLevelDomain, options: .caseInsensitive) else {
                return false
            }
        }
        
        for part in parts {
            guard isMatch(input: part, pattern: TLDPattern.webUrl, options: .caseInsensitive) else {
                return false
            }
            if isMatch(input: part, pattern: TLDPattern.fullWidthChar) {
                return false
            }
            if part.hasPrefix("-") || part.hasSuffix("-") {
                return false
            }
        }
        
        return true
    }
    
}
