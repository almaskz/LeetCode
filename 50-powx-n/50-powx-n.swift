class Solution {
    // x = 2, n = 3
    // x  n
    
    func fastPow(_ x: Double, _ n: Int) -> Double {
        if n == 0 {
            return 1.0
        }
        
        var half = fastPow(x, n/2)
        if n % 2 == 0 {
            return half * half
        } else {
            return half * half * x
        }
    }
     
    func myPow(_ x: Double, _ n: Int) -> Double {
        if n < 0 {
            return fastPow(1/x, -n)
        } else {
            return fastPow(x, n)
        }
    }
}