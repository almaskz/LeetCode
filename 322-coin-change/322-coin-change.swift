class Solution {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        var memo = Array(repeating: Int.max, count: amount+1)
        memo[0] = 0
        var target = amount
        return numberOfCoins(coins, &target, &memo)
    }
    
    func numberOfCoins(_ coins:[Int], _ target: inout Int, _ memo: inout [Int]) -> Int {
        // base case 
        if target < 0 {
            return Int.max
        }
        if target == 0 {
            return 0
        }
        
        if memo[target] != Int.max {
            return memo[target]
        }
        
        var curMin = Int.max
        for coin in coins {
            var diff = target - coin
            let result = numberOfCoins(coins, &diff, &memo)
            if result >= 0 && result < curMin - 1 {
                curMin = 1 + result   
            }
        }
        
        memo[target] = curMin == Int.max ? -1 : curMin
        return memo[target]
    }
}