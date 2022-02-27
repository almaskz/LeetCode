class Solution {
    func mySqrt(_ x: Int) -> Int {
        var lo = 0
        var hi = x
        // x = 8
        // lo = 0 | 2 | 
        // hi = 8 | 4 | 
        // mid= 4 | 2 | 2
        while lo < hi {
            let mid = lo + (hi-lo)/2
            if condition(mid, x) {
                hi = mid
            } else {
                lo = mid + 1 
            }
        }
        return x < 2 ? x : lo - 1
    }
    
    func condition(_ mid: Int, _ x: Int) -> Bool {
        return mid*mid > x
    }
}