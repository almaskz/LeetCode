class Solution {
    func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
        var lo = 1
        var hi = piles.max() ?? 0
        
        while lo < hi {
            let mid = lo + (hi-lo)/2
            if condition(mid, piles, h) {
                hi = mid
            } else {
                lo = mid + 1
            }
        }
        return lo
    }
    
    func condition(_ speed: Int, _ piles: [Int], _ h: Int) -> Bool {
        var hoursSpend = 0
        for pile in piles {
            var hoursNeeded = Int(ceil(Double(pile)/Double(speed)))
            hoursSpend += hoursNeeded
            if hoursSpend > h {
                return false
            }
        }
        return true
    }
}