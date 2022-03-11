class Solution {
    func canJump(_ nums: [Int]) -> Bool {
        var canReach = Array(repeating: false, count: nums.count)
        canReach[0] = true
        for i in 0..<nums.count {
            if canReach[i] && nums[i] > 0 {
                var l = 1
                while i + l < nums.count && l <= nums[i] {
                    canReach[i+l] = true
                    l += 1
                }
            }
        }
        print(canReach)
        //[true, false, false, false, false]
        //[2,3,1,1,4]
        // i
        // //
        return canReach[nums.count-1]
    }
}