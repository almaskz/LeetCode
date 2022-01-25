class Solution {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        //[1,2,5] amount = 6
        //
        // f(n) = the fewest number of coins needed to make n {}
        // f(0) = {} = 0 
        // f(1) = {1} = 1 
        // f(2) = {1 1} or {2}  = 1 
        // f(3) = {1 1 1} or {2 1} = 2
        // f(4) = {1111} or {2 1 1} or {2 2} = 2
        // f(5) = {11111} or {2111} or {221} or {5} = 1
        // f(6) = {5 1} = 2
        // f(7) = {5 2} = 2 = 
        
        var dp = Array(repeating: amount+1, count: amount+1)
        dp[0] = 0
        
        //  0 1 2 3 4 5
        // [0 1 1 2 6 6]
        //        i
        // [1 2 5] 
        // coin = 1
        for i in stride(from: 1, through: amount, by: 1) {
            for coin in coins {
                if i - coin >= 0 {
                    dp[i] = min(dp[i], 1 + dp[i-coin])    
                }
            }
        }
        
        return dp[amount] == amount+1 ? -1 : dp[amount]
    }
}