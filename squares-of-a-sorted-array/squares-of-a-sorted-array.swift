class Solution {
    func sortedSquares(_ nums: [Int]) -> [Int] {
        var squares = Array(repeating: 0, count: nums.count)
        
        var l = 0
        var r = nums.count - 1
        var count = 0
        while l <= r {
            if (nums[l] * nums[l]) > (nums[r] * nums[r]) {
                squares[count] = nums[l] * nums[l]
                l += 1
            } else {
                squares[count] = nums[r] * nums[r]
                r -= 1
            }
            count += 1
        }
        
        return squares.reversed()
    }
}