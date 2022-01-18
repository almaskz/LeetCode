class Solution {
    func findMin(_ nums: [Int]) -> Int {
        // 0 1 2 3 4 5 6
        //[4,5,6,7,0,1,2]
        //     l m     r 
        // result = 0
        // if m >= l => search right
        // else search left
        
        var left = 0, right = nums.count-1
        var result = nums[0]
        
        while left <= right {
            if nums[left] < nums[right] {
                return min(result, nums[left])
            } else {
                let mid = (left+right)/2
                result = min(result, nums[mid])
                if nums[mid] >= nums[left] {        // search the right side
                    left = mid + 1
                } else {
                    right = mid - 1                 // search the left side
                }
            }
        }
        return result
    }
}