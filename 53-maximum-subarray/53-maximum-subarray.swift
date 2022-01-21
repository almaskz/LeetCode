class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        //[5,4,-1,7,8]
        //   i
        // cur = 
        // max = 5
        var result = nums[0]
        
        var cur = result
        for i in 1..<nums.count {
            cur = max(cur+nums[i], nums[i])
            result = max(cur, result)
        }
        
        return result
    }
}