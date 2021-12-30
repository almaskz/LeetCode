class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var stack = [Int]()
        var maxSoFar = 0
        for i in prices {
            if stack.isEmpty || stack[stack.count-1] >= i {
                stack.append(i)
            } else if !stack.isEmpty {
                let last = stack[stack.count-1]
                maxSoFar = max(maxSoFar, i - last)
            }
        }
        
        return maxSoFar
    }
}