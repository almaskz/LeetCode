class Solution {
    func longestSubarray(_ nums: [Int]) -> Int {
        //  0 1 2 3 4 5 6 7 8
        // [1,1,1]
        //s       i
        var i = 0
        var skipIndex = -1
        var maxSubarray = 0
        var cur = 0             
        while i < nums.count {
            if nums[i] == 1 {
                cur += 1                // 3
                i += 1
            } else if skipIndex == -1 {
                skipIndex = i           // 
                i += 1
            } else {
                i = skipIndex + 1       // 5
                maxSubarray = max(maxSubarray, cur)     // 5
                cur = 0                 // 0
                skipIndex = -1          // -1 
            }
        }
        if skipIndex == -1 {
            cur -= 1
        } 
        return max(maxSubarray, cur)
    }
}