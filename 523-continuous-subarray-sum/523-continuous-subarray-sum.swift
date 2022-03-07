class Solution {
    func checkSubarraySum(_ nums: [Int], _ k: Int) -> Bool {
        //[23,2,4,6,7]   k = 6
        //  
        //    
        var remainder = [Int: Int]() // remainder -> index
        var total = 0
        
        remainder[0] = -1
        
        for i in 0..<nums.count {
            total += nums[i]
            let val = total % k
            if remainder[val] == nil {
                remainder[val] = i
            } else if let index = remainder[val], i - index > 1 {
                return true
            }
        }
        return false
    }
}