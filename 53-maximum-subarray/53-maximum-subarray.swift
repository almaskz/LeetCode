class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        let r = nums.count-1
        let mid = (0+r)/2
        
        return maxSubArray(nums, 0, r)
    }
    
    func maxSubArray(_ arr: [Int], _ l: Int, _ r: Int) -> Int {
        // base case 
        if l == r {
             return arr[l]
        }
        
        let m = (l+r)/2 
        
        let left = maxSubArray(arr, l, m)
        let right = maxSubArray(arr, m+1, r)
        let center = maxCrossing(arr, l, r, m)
        
        return max(left, right, center)
    }
    
    func maxCrossing(_ arr: [Int], _ l: Int, _ r: Int, _ m: Int) -> Int {
        var maxLeft = arr[m]
        var cur = maxLeft
        for i in stride(from: m-1, through: l, by: -1) {
            cur += arr[i]
            maxLeft = max(maxLeft, cur)
        }
        
        var maxRight = arr[m+1] 
        cur = maxRight
        for i in stride(from: m+2, through: r, by: 1) {
            cur += arr[i]
            maxRight = max(maxRight, cur)
        }
        
        return maxLeft+maxRight
    }
}