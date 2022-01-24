class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        // 0  1  2 3  4 5
        //[-3 4 -1 2 1 -5]
        //  l         m        r
        //[-2 1 -3 4]  []
        //[-2] left = -2
        //    [1 -3 4]
        //    [1] = left = 1
        //      [-3 4] 
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