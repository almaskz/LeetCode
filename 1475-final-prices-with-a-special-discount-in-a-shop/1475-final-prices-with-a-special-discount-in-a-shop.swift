class Solution {
    func finalPrices(_ prices: [Int]) -> [Int] {
        guard prices.count > 1 else { return prices }
        
        //[8 4 6 2 3]
        // 
        
        var ans = [Int]()
        //ans.reserveCapacity(prices.count)
        var discount = 0
        for i in 0..<prices.count {
            discount = 0
            for j in stride(from: i+1, to: prices.count, by: 1) {
                if prices[j] <= prices[i] {
                    discount = prices[j]
                    break
                }     
            }
            ans.append(prices[i] - discount)
        }
        return ans
    }
}