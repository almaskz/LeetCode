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
     
        var result = nums[0]
        
        for i in 1..<nums.count {
            result ^= nums[i]
        }
        for i in 0...nums.count {
            result ^= i
        }
        
        return result
        
    }
}