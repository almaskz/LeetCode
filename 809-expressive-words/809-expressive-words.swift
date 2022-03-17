class Solution {
    func expressiveWords(_ s: String, _ words: [String]) -> Int {
        var count = 0
        for word in words {
            if isStretchy(word, s) {
                count += 1
            }
        }
        return count
    }
    
    func isStretchy(_ word: String, _ pattern: String) -> Bool {
        guard word.count <= pattern.count else { return false }
        if word == pattern { return true }
        var l = 0 
        var r = 0
        
        //hello = word
        // l
        //helloo = pattern
        // r
        var arr1 = Array(word)
        var arr2 = Array(pattern)
        
        while l < arr1.count && r < arr2.count {
            let ch1 = arr1[l] 
            var count1 = 0
            while l < arr1.count && ch1 == arr1[l] {
                count1 += 1 
                l += 1
            }
            
            let ch2 = arr2[r]
            var count2 = 0
            while r < arr2.count && ch2 == arr2[r] {
                count2 += 1
                r += 1
            }
            
            if ch1 == ch2 {
                if count1 == count2 {
                    continue
                } else if count2 < 3 {
                    return false
                } else if count1 > count2 {
                    return false
                } else {
                    continue
                }
            } else {
                return false
            }
        }
        return l == arr1.count && r == arr2.count
        
    }
}