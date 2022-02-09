class Solution {
    /*
    x = 3, n = 5 
    1 2  3 4    5
    3 9 27 81 243
    
    
    */
     
    func myPow(_ x: Double, _ n: Int) -> Double {
        func fastPow(_ x: Double, _ n: Int) -> Double {
            if x == 0 { return 0 }
            if n == 0 { return 1 }
            
            var half = fastPow(x, n/2)
            if n % 2 == 0 {
                return half * half
            } else {
                return half * half * x
            }
        } 
        
        var ans = fastPow(x, abs(n))
        if n < 0 {
            return 1.0/ans
        } else {
            return ans
        }
    }
}