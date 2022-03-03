class Solution {
    func numberOfArithmeticSlices(_ nums: [Int]) -> Int {
        guard nums.count > 2 else { return 0 }
        
        var count = 0
        // 0 1 2 3
        //[1,2,3,4]
        // i
        //     l r
        // count = 1
        for i in 0...nums.count-3 {
            var l = i + 1
            var r = i + 2
            let diff = (nums[l] - nums[i])    
            while (r < nums.count && (nums[r] - nums[l]) == diff ) {
                count += 1
                l += 1
                r += 1
            }
        }
        
        return count
    }
}