extension Validator
{
    public class func isBoolean(_ str: String) -> Bool {
        let idx = ["true", "false", "yes", "no", "1", "0"].index(of: str)
        if (idx != nil) {
            return true
        }
        return false
    }
}
