class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        // nums =  [1, 2, 3, 4]
        // pre  =   1  2  6 24
        // post =  24 24 12  4 
        //result = 24 12  8  6
        
        var prefix = Array(repeating: 1, count: nums.count)        
        for i in 0..<nums.count {
            prefix[i] = nums[i] * (i > 0 ? prefix[i-1] : 1)
        }
        
        var postfix = Array(repeating: 1, count: nums.count)
        for i in stride(from: nums.count-1, through: 0, by: -1) {
            postfix[i] *= nums[i] * (i < nums.count-1 ? postfix[i+1] : 1)
        }
        
        var result = Array(repeating: 1, count: nums.count)
        var prefixVal = 1
        var postfixVal = 1
        for i in 0..<nums.count {
            prefixVal = i > 0 ? prefix[i-1] : 1
            postfixVal = i < nums.count-1 ? postfix[i+1] : 1
            result[i] = prefixVal * postfixVal
        }
        return result
    }
}