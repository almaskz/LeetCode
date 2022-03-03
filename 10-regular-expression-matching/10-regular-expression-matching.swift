class Solution {
    func isMatch(_ s: String, _ p: String) -> Bool {
        var str = Array(s)
        var pattern = Array(p)
        
        var cache = [String: Bool]() 
        
        func recursive(_ i: Int, _ j: Int) -> Bool {
            if let inCache = cache["\(i),\(j)"] {
                return inCache
            }
            //base cases
            if i >= str.count && j >= pattern.count {
                return true
            } else if j >= pattern.count {        // a => a*b*
                return false
            } 
            
            var match = i < str.count && (str[i] == pattern[j] || pattern[j] == ".")
            
            // handle *
            if (j + 1 < pattern.count && pattern[j+1] == "*") {
                // 1. dont use the "*"
                // 2. use the "*" only if we have a match of s[i] == p[j]
                cache["\(i),\(j)"] = recursive(i, j+2) || (match && recursive(i+1, j))
                return cache["\(i),\(j)"]!
            }
            if match {
                cache["\(i),\(j)"] = recursive(i+1, j+1)
                return cache["\(i),\(j)"]!
            } else{
                cache["\(i),\(j)"] = false
                return cache["\(i),\(j)"]!
            }
        }
        
        return recursive(0, 0)
    }
}