class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        //[-2,1,-3,4,-1,2,1,-5,4]
        //         i
        // cur = 4
        // max = 1
        var cur = 0
        var result = nums[0]
        for i in nums {
            if cur < 0 {
                cur = 0
            }
            cur += i
            result = max(cur, result)
        }
        
        return result
    }
}