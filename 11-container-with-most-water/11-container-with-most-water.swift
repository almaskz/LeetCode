class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var left = 0
        var right = height.count-1
        var maxWater = 0            // (right - left) * min(heights)
        // 0 1 2 3 4 5 6 7 8
        //[1,8,6,2,5,4,8,3,7]
        //   l
        //               r
        // cur = 7-1*3
        // max = 49
        while left < right {
            let curWater = (right-left) * min(height[left], height[right])
            maxWater = max(maxWater, curWater)
            if height[left] < height[right] {
                left += 1
            } else {
                right -= 1
            }
        }
        return maxWater
    }
}