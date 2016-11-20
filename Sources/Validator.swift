import Foundation

public final class Validator
{
    class func regexWithPattern(pattern: String, options: NSRegularExpression.Options = []) -> NSRegularExpression? {
        do {
            return try NSRegularExpression(pattern: pattern, options: options)
        } catch {
            print("Couldn't initialize the regular expression!")
            return nil
        }
    }
    
    internal class func isMatch(input: String, pattern: String, options: NSRegularExpression.Options = []) -> Bool {
        if let regex = regexWithPattern(pattern: pattern, options: options) {
            return regex.numberOfMatches(in: input, options: [], range: NSRange(location: 0, length: input.characters.count)) > 0
        } else {
            return false
        }
    }
    
    internal class func firstMatch(input: String, pattern: String, options: NSRegularExpression.Options = []) -> String? {
        if let regex = regexWithPattern(pattern: pattern, options: options) {
            guard let nsInput = input as NSString? else {
                return nil
            }
            guard let result = regex.firstMatch(in: input, options: [], range: NSRange(location: 0, length: input.characters.count)) else {
                return nil
            }
            guard result.numberOfRanges > 1 else {
                return nil
            }
            
            let resultRange = result.rangeAt(1)
            return nsInput.substring(with: resultRange)
        } else {
            return nil
        }
    }
}
