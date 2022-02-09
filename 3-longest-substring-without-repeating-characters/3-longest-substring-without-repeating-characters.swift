class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        guard s.count > 1 else { return s.count }
        // 0 1 2 3 4 5 6 7
        //"a b c a b c b b"
        // l 
        // r
        
        // set = b
        // max = 3
        
        var arr = Array(s) 
        var set = Set<Character>()
        var l = 0
        var maxLength = 0
        
        for r in l..<arr.count {
            while set.contains(arr[r]) {
                set.remove(arr[l])
                l += 1   
            }
            set.insert(arr[r])
            maxLength = max(maxLength, r-l+1)
        }
        
        return maxLength
    }
}