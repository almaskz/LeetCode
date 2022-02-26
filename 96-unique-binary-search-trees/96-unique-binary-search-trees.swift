class Solution {
    func numTrees(_ n: Int) -> Int {
        /*
        dp[0] = 1
        dp[1] = 1
        dp[2] = [1 2]
        dp[3] = dp[1]*dp[3-1] + dp[2]*dp[1] + dp[3]*dp[1]
        */
        var dp = Array(repeating: 0, count: n+1)
        dp[0] = 1
        dp[1] = 1
        
        
        for node in stride(from: 2, through: n, by: 1) {
            var total = 0
            for root in 1...node {
                let left = root - 1
                let right = node - root
                total += dp[left]*dp[right]
            }
            dp[node] = total
        } 
        
        return dp[n]
    }
}