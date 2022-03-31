class Solution {
    func splitArray(_ nums: [Int], _ m: Int) -> Int {
        // [7,2,5,10,8], m = 2
        
        var lo = nums.max() ?? 0
        var hi = nums.reduce(0, +)
        
        while lo < hi {
            let mid = lo + (hi-lo)/2
            if condition(mid, nums, m) {
                hi = mid 
            } else {
                lo = mid + 1 
            }
        }
        return lo
    }
    
    // [7,2,5,10,8], m = 2 ; 18
    //         l
    // cur = 14
    // 18 -> 7
    func condition(_ threshold: Int, _ nums: [Int], _ m: Int) -> Bool {
        var count = 1
        var curSum = 0
        for num in nums {
            curSum += num
            if curSum > threshold {
                count += 1
                curSum = num
                if count > m {
                    return false
                }
            }
        }
        return true
    }
}