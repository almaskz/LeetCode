class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        //1 [1,2,3,4] p = 6
        //         i
        //  [1 1 2 6]
        //        <-r
        // [24 12 4 1]
        //  24 12 8 6
        
        var result = Array(repeating: 1, count: nums.count)
        
        var product = 1
        for i in 0..<nums.count {
            result[i] = product
            product *= nums[i]
        }
        
        product = 1
        for i in stride(from: nums.count-1, through: 0, by: -1) {
            result[i] *= product
            product *= nums[i]
        }
        
        return result
    }
}