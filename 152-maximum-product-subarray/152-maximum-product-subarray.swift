class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        //  [2, 3, -2, 4]
        //dp[2  6  -2  4]
        //dp[-0 2   6  6]
        //  [-2,0,-1]
        //dp[-2 0  0]
        //dp[-0-2  0]
        var result = nums.max()!
        
        var curMin = 1
        var curMax = 1
        var temp = 0
        for i in nums {
            if i == 0 {
                curMin = 1
                curMax = 1
                continue
            }
            temp = i*curMin
            curMin = min(i*curMax, i*curMin, i)
            curMax = max(i*curMax, temp, i)
            result = max(curMax, result)
        }
        return result
    }
}