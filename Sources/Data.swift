extension Validator
{
    // MARK: Byte length
    public enum ByteLengthOption {
        case min(Int)
        case max(Int)
        case minMax(min: Int, max: Int)
    }
    
    public class func isByteLength(str: String, option: ByteLengthOption) -> Bool {
        var min = 0
        var max = Int.max
        
        switch option {
        case .min(let minLen):
            min = minLen
        case .max(let maxLen):
            max = maxLen
        case .minMax(let minLen, let maxLen):
            min = minLen
            max = maxLen
        }
        
        let len = str.lengthOfBytes(using: .utf8)
        return len >= min && len <= max
    }
}
