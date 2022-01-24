class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        // 
        // [1, 2, 3, 4]
        // product = 1*1*2*3
        //->1  1  2  6
        // product = 1*4*3*2
        // 24 12  4  1 <-
        // 24 12  8  6
        
        var product = 1
        var result = Array(repeating: 1, count: nums.count)
        
        
        // [1 2 3 4]
        // [1 1 2 6]
        //        i
        for i in 0..<nums.count {
            result[i] = product             // 1 | 1 | 2 | 6
            product *= nums[i]              // 1 | 2 | 6 | 24
        }
        
        product = 1
        // [1 2 3 4]
        // [1 1 8 6]
        //    i
        for i in stride(from: nums.count-1, through: 0, by: -1) {
            result[i] *= product            // 6 | 8 | 12 | 24  
            product *= nums[i]              // 4 | 12| 24 | 24
        }
        
        return result
    }
}