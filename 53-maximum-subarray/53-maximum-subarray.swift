class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        //[-2,1,-3,4,-1,2,1,-5,4]
        //                     i
        // cur = 5
        // max = 6
        var cur = nums[0]
        var maxSoFar = cur
        
        for i in 1..<nums.count {
            if cur < 0 {
                cur = nums[i]
            } else {
                cur += nums[i]
            }
            
            maxSoFar = max(maxSoFar, cur)
        }
        
        return maxSoFar
    }
}