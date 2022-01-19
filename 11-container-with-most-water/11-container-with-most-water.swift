class Solution {
    func maxArea(_ height: [Int]) -> Int {
        // 0 1 2 3 4 5 6 7 8
        //[1,8,6,2,5,4,8,3,7]
        //     l       r
        // cur = 6*4=28
        // max = 49
        
        var l = 0, r = height.count-1
        var maxArea = 0 
        
        while l < r {
            var cur = min(height[l], height[r]) * (r-l)
            maxArea = max(cur, maxArea)
            if height[l] < height[r] {
                l += 1
            } else {
                r -= 1
            }
        }
        
        return maxArea 
    }
}