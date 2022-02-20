class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        //[-2 ]
        //[-2,1,-3,4,-1,2,1,-5,4]
        //         l           r
        // cur 1
        //
        var maxSum = nums[0]                // -2
        var l = 0, r = l + 1
        
        var curSum = maxSum                 // -2
        while r < nums.count {              //
            if curSum + nums[r] < nums[r] { // 
                curSum = nums[r]            // cur = 4
                l = r                       // 
            } else {
                curSum += nums[r]           // cur = 1
            }
            maxSum = max(maxSum, curSum)    // max = 6
            r += 1
        }
        
        return maxSum
    }
}