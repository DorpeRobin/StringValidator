extension Validator
{    
    struct NumberPattern {
        static let int      = "^[-+]?[0-9]+$"
        static let numeric  = "^[-+]?[0-9]+$"
        static let decimal  = "[-+]?([0-9]+|\\.[0-9]+|[0-9]+\\.[0-9]+)$"
        static let float    = "^(?:[-+]?(?:[0-9]+))?(?:\\.[0-9]*)?(?:[eE][\\+\\-]?(?:[0-9]+))?$"
    }
    
    // MARK: Int
    public class func isInt(_ str: String) -> Bool {
        return isMatch(input: str, pattern: NumberPattern.int) && !str.isEmpty
    }
    
    // MARK: Numeric
    public class func isNumeric(_ str: String) -> Bool {
        return isMatch(input: str, pattern: NumberPattern.numeric) && !str.isEmpty
    }
    
    // MARK: Decimal
    public class func isDecimal(_ str: String) -> Bool {
        return isMatch(input: str, pattern: NumberPattern.decimal) && !str.isEmpty
    }
    
    // MARK: Float
    public class func isFloat(_ str: String) -> Bool {
        return isMatch(input: str, pattern: NumberPattern.float) && !str.isEmpty && str != "."
    }
}
