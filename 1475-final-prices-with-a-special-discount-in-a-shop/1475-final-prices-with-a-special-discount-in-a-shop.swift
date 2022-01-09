class Solution {
    func finalPrices(_ prices: [Int]) -> [Int] {
        guard prices.count > 1 else { return prices }
        
        //  0  1 2 3
        // [10,1,1,6]
        //         i
        // stack = [23] 
        // 
        // 
        // [9 0 1 6]
        
        var ans = prices
        return stackSolution(&ans)
    }
    
    func stackSolution(_ prices: inout [Int]) -> [Int] {
        var stack = [Int]() // indecies
        stack.reserveCapacity(prices.count)
        
        for i in 0..<prices.count {
            while !stack.isEmpty && prices[stack.last!] >= prices[i] {
                let index = stack.removeLast()
                prices[index] -= prices[i]
            }
            stack.append(i)
        }
        
        return prices
    }
}