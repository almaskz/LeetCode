class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        // 0  1 2 3 4 5
        //[-1,0,3,5,9,12]       // target = 3 
        //    l
        //      h
        //    m
        
        
        var lo = 0, hi = nums.count-1
        
        while lo <= hi {
            let mid = lo + (hi-lo+1)/2
            if target > nums[mid] {
                lo = mid + 1
            } else if target < nums[mid] {
                hi = mid - 1
            } else {
                return mid
            }
        }
        return -1
    }
}