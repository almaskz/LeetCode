class Solution {
    func isMatch(_ s: String, _ p: String) -> Bool {
        var str = Array(s)
        var pattern = Array(p)
        
        func recursive(_ i: Int, _ j: Int) -> Bool {
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
                return recursive(i, j+2) || (match && recursive(i+1, j))
            }
            if match {
                return recursive(i+1, j+1)
            } else{
                return false    
            }
        }
        
        return recursive(0, 0)
    }
}