class Solution {
    func climbStairs(_ n: Int) -> Int {
        // f(n) - distinct ways to climb to the n stairs (can take 1 or 2 steps)
        // f(0) = 0
        // f(1) = 1
        // f(2) = 1 and 1 or just 2 steps => 2 ways
        // f(3) = f(2) + 1 or f(1) + 2 = 2 + 1 = 3
        // f(4) = f(3) + 1 or f(2) + 2 = 3 + 2 = 5 
        if n == 1 {
            return 1
        } else if n == 2 {
            return 2 
        }
        var dp = Array(repeating: 0, count: n+1)
        dp[1] = 1
        dp[2] = 2
        for i in 3...n {
            dp[i] = dp[i-1] + dp[i-2]
        }
        return dp[n]
    }
}