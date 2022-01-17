class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        // nums =  [-1  1  0  -3  3]
        //result =   1 -1 -1   0  0
        //                       0 
        //result = 24 12  8  6
        
        var result = Array(repeating: 1, count: nums.count)        
        var prefix = 1
        // nums =   -1  1  0  -3  3
        //result =   1  1  1   1  1
        //              i
        // prefix = 1
        for i in 0..<nums.count {
            result[i] = prefix
            prefix *= nums[i]
        }
        
        var postfix = 1
        for i in stride(from: nums.count-1, through: 0, by: -1) {
            result[i] *= postfix
            postfix *= nums[i]
        }
        
        return result
    }
}