class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        // idea: keep track of max and min (as -big # * - big # = big + #)
        //[ 2,3,-2,4]
        //[-2,3,-4]
        //       i  
        // curMin = 26
        // curMax = -4
        // max = 3
        
        var result = nums[0]
        var curMin = result
        var curMax = result
    
        for i in 1..<nums.count {
            /*if curMin*nums[i] < curMin {
                curMin *= nums[i]
            } else {
                curMin = nums[i]
            }*/
            let temp = curMax
            curMax = max(curMax*nums[i], curMin*nums[i], nums[i])
            curMin = min(curMin*nums[i], temp*nums[i],nums[i])
            result = max(curMax, result)
        }
        
        return result
    }
}