class Solution {
    func sortedSquares(_ nums: [Int]) -> [Int] {
        //[-7,-3,2,3,11]
        //       lr 
        //[ 4 9 9 49 121] 
        //    i
        
        var l = 0
        var r = nums.count-1
        var result = Array(repeating: 0, count: r+1)
        var index = r
        while l <= r {
            if nums[l]*nums[l] > nums[r]*nums[r] {
                result[index] = nums[l]*nums[l]
                l += 1
            } else {
                result[index] = nums[r]*nums[r]
                r -= 1
            }
            index -= 1
        }
        return result
    }
}