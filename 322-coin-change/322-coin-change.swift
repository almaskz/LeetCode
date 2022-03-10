class Solution {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        //coins = [1,2,5], amount = 11
        // f[0] = [0-1, 0-2, 0-5] = 0
        // f[1] = 1 or 2 or 5
        // f[2] = 1+1=2 or 1+2=3 or 1+5=6 or 
        /*
        coins = [1 2 5]
        dp[0] = 0
        dp[1] = 1
        dp[2] = for each coin in coins { }
        */
        
        var dp = Array(repeating: Int.max, count: amount+1)
        dp[0] = 0
        
        for i in stride(from: 1, through: amount, by: 1) {
            for coin in coins {
                if i - coin >= 0 && dp[i-coin] != Int.max {
                    dp[i] = min(dp[i], dp[i-coin] + 1)
                }
            }
        }
        return dp[amount] == Int.max ? -1 : dp[amount]
    }
}