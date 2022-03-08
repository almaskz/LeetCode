class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else { return false }
        var countS = [Character: Int]()
        for char in s {
            countS[char, default: 0] += 1
        }
        
        for char in t {
            if let freq = countS[char] {
                if freq < 1 {
                    return false
                } else {
                    countS[char] = freq-1 
                }
            } else {
                return false
            }
        }
        return true
    }
}