class Solution {
    func shipWithinDays(_ weights: [Int], _ days: Int) -> Int {
        //[1,2,3,4,5,6,7,8,9,10] days = 5
        // min load = 10
        // max load = sum of weights = 55 / 5 = (18+1)=19
        var lo = weights.max() ?? 0
        var hi = weights.reduce(0, +)
        
        while lo < hi {
            let mid = lo + (hi-lo)/2
            if condition(mid, weights, days) {
                hi = mid
            } else {
                lo = mid + 1
            }
        }
        
        return lo
    }
    
    func condition(_ capacity: Int, _ weights: [Int], _ days: Int) -> Bool {
        var count = 1
        var curLoad = 0
        
        for weight in weights {
            curLoad += weight
            if curLoad > capacity {
                count += 1
                curLoad = weight 
                if count > days {
                    return false
                }
            }
        }
        return true
    }
}