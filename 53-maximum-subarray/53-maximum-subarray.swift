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
        return maxSubArray(0, nums.count-1, nums)
    }
    
    func maxSubArray(_ l: Int, _ r: Int, _ arr: [Int]) -> Int {
        // base case 
        if l >= r {
            return arr[l]
        }
        
        let m = (l+r)/2
        let left = maxSubArray(l, m, arr)
        let right = maxSubArray(m+1, r, arr)
        let mid = countMid(l, m, r, arr)
        
        return max(left, right, mid)
    }
    
    func countMid(_ l: Int, _ m: Int, _ r: Int, _ arr: [Int]) -> Int {
        var cur = arr[m]
        var resultLeft = cur
        for i in stride(from: m-1, through: l, by: -1) {
            cur += arr[i]
            resultLeft = max(cur, resultLeft)
        }
        
        cur = arr[m+1]
        var resultRight = cur
        for i in stride(from: m+2, through: r, by: 1) {
            cur += arr[i]
            resultRight = max(resultRight, cur)
        }
        return resultLeft+resultRight
    }
}