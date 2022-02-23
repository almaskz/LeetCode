class Solution {
    func minCost(_ costs: [[Int]]) -> Int {
        let cost = recursive(costs, 0)
        return min(cost[0], cost[1], cost[2])
    }
    
    func recursive(_ costs: [[Int]], _ index: Int) -> [Int] {
        guard index < costs.count else { return [0, 0, 0] }
        
        let nextCost = recursive(costs, index + 1)
        let red = costs[index][0] + min(nextCost[1], nextCost[2])
        let blue = costs[index][1] + min(nextCost[0], nextCost[2])
        let green = costs[index][2] + min(nextCost[0], nextCost[1])
        
        return [red, blue, green]
    }
}