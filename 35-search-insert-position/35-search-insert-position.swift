class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        // 0 1 2 3
        //[1,3,5,6] target = 5
        //    [   ] 
        /*
        lo = 3 
        hi = 3
        mid =2
        5 > 5
        */
        var lo = 0
        var hi = nums.count
        
        while lo < hi {
            let mid = lo + (hi-lo)/2
            if condition(nums, mid, target) {
                hi = mid
            } else {
                lo = mid + 1
            }
        }
        
        return lo 
    }
    
    func condition(_ nums: [Int], _ mid: Int, _ target: Int) -> Bool {
        return nums[mid] >= target
    }
}