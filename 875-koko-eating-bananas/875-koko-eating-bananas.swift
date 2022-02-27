class Solution {
    func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
        // piles = [30,11,23,4,20], h = 5
        // min = 1
        // max = 30
        var lo = 1
        var hi = piles.max() ?? 0
        
        while lo < hi {
            let mid = lo + (hi-lo)/2        // 1+(30-1)/2=9+1=10
            if condition(mid, piles, h) {   // 
                hi = mid
            } else {
                lo = mid + 1
            }
        }
        return lo
    }
    
    func getAvg(_ piles: [Int], _ h: Int) -> Int {
        var avg = 0
        for pile in piles {
            avg += pile/h
        }
        return avg
    }
    
    // 10
    func condition(_ speed: Int, _ piles: [Int], _ h: Int) -> Bool {
        var curHours = 0
        for pile in piles {
            curHours += Int(ceil(Double(pile)/Double(speed)))
            if curHours > h {
                return false
            }
        }
        return true
    }
}