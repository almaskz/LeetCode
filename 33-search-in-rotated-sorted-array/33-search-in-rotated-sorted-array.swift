class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var left = 0, right = nums.count-1
        while left <= right {
            let mid = (left+right)/2
            if nums[mid] == target {
                return mid
            } else {
                if nums[mid] >= nums[left] {
                    if nums[left] <= target && target < nums[mid] {
                        // search left
                        right = mid - 1
                    } else {
                        //search right
                        left = mid + 1
                    }
                } else {
                    if nums[right] >= target && target > nums[mid] {
                        // search right
                        left = mid + 1
                    } else {
                        // search left
                        right = mid - 1
                    }
                }
            }
        }
        return -1
    }
}