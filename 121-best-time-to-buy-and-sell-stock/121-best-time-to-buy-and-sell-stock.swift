class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        //  0 1 2 3 4 5
        // [7,1,5,3,6,4]
        //            i 
        // stack = [7 1]
        // max = 5
        
        var curMin = prices[0]
        var curMax = 0
        for i in 1..<prices.count {
            if prices[i] > curMin {
                curMax = max(curMax, prices[i] - curMin)
            } else {
                curMin = prices[i]
            }
        }
        return curMax
    }
}