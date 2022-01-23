class Solution {
    func missingNumber(_ nums: [Int]) -> Int {
        //[0,1]
        // 0000 = 0 
        // 0001 = 1 
        
        // 0010 = 2
        // 0011 = 3 
        
        // 0000
        // 0001
        // 0001
        // 0010
        // 0011
        
        // 0001
        // 0010
     
        var sum = 0
        for i in 1...nums.count {
            sum += i 
        }
        for i in nums {
            sum -= i
        }
        
        return sum
        
        /*
        var result = nums[0]
        
        for i in 1..<nums.count {
            result ^= nums[i]
        }
        return result
        */
    }
}