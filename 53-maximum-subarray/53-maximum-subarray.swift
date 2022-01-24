class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        guard nums.count > 1 else { return nums[0] }
        return maxSubArray(0, nums.count-1, nums)
    }
    
    func maxSubArray(_ l: Int, _ r: Int, _ arr: [Int]) -> Int {
        // base case 
        if l >= r {             // l < r 
            return arr[l]
        }
        
        let m = l+(r-l+1)/2                 // avoid overflow, m
        let left = maxSubArray(l, m-1, arr) // 
        let right = maxSubArray(m, r, arr)  // middle in the right side
        let mid = countMid(l, m, r, arr)
        
        return max(left, right, mid)
    }
    
    // calculate consistently to the way we split middle, from l -> m-1 and m -> r
    func countMid(_ l: Int, _ m: Int, _ r: Int, _ arr: [Int]) -> Int {
        var resultLeft = 0
        if m-1 >= l {
            var cur = arr[m-1]
            resultLeft = cur
            for i in stride(from: m-2, through: l, by: -1) {
                cur += arr[i]
                resultLeft = max(cur, resultLeft)
            }
        } 
        
        var cur = arr[m]
        var resultRight = cur
        for i in stride(from: m+1, through: r, by: 1) {
            cur += arr[i]
            resultRight = max(resultRight, cur)
        }
        return resultLeft+resultRight
    }
}