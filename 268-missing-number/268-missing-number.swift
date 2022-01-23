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
     
        var hash = [Int: Bool]()
        
        for i in 0...nums.count {
            hash[i] = true
        }
        for i in nums {
            hash[i] = false
        }
        
        return hash.first(where: { $0.value })!.key
        
        /*
        var result = nums[0]
        
        for i in 1..<nums.count {
            result ^= nums[i]
        }
        return result
        */
    }
}