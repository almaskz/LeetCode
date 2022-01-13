class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var curMin = prices[0]
        var maxDiff = 0
        for i in 1..<prices.count {
            if prices[i] > curMin {
                maxDiff = max(maxDiff, prices[i] - curMin)
            } else {
                curMin = prices[i]   
            }
        }
        return maxDiff
    }
}