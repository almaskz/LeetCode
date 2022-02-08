class Solution {
    func climbStairs(_ n: Int) -> Int {
        // f(n) - number of ways to climb the stairs
        // f(0) = 1
        // f(1) = 1
        // f(2) = f(1) + f(0) = 2
        // f(3) = f(2) + f(1) = 2 + 1 = 3 
        // f(4) = f(3) + f(2) = 3 + 2 = 5
        if n == 1 { return 1 }
        if n == 2 { return 2 }
        
        var f1 = 1
        var f2 = 2
        for i in 3...n {
            let temp = f2
            f2 += f1
            f1 = temp
        }
        return f2
    }
}