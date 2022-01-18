class Solution {
    func findMin(_ nums: [Int]) -> Int {
        // 0 1 2 3 4 
        //[4,5,1,2,3]
        // l      m    r 
        // result = 0
        // if m >= l => search right
        // else search left
        
        var l = 0, r = nums.count-1
        var result = nums[0]
        
        while l <= r {
            if nums[l] < nums[r] {
                return min(result, nums[l])
            }
            var m = (l + r) / 2
            result = min(result, nums[m])
            if nums[m] >= nums[l] {
                l = m + 1
            } else {
                r = m - 1
            }
        }
        return result
    }
}