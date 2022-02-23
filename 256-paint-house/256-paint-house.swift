class Solution {
    func minCost(_ costs: [[Int]]) -> Int {
        // red blue green
        var red = costs[0][0]
        var blue = costs[0][1]
        var green = costs[0][2]
        
        for i in 1..<costs.count {
            let curRed = costs[i][0] + min(blue, green)
            let curBlue = costs[i][1] + min(red, green)
            let curGreen = costs[i][2] + min(red, blue)
            
            red = curRed
            blue = curBlue
            green = curGreen
        }
        
        return min(red, blue, green)
    }
}