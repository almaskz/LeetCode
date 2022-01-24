class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        // 
        //[-2 1 -3 4 -1 2 1 -5 4]
        //                     i
        // 
        // cur = max(nums[i], cur + nums[i]) 5
        // max = max(cur, max)               6 
        
        // 
        
        var cur = nums[0]
        var result = cur
        
        for i in 1..<nums.count {
            cur = max(nums[i], cur + nums[i])
            result = max(cur, result)
        }
        
        return result
    }
}