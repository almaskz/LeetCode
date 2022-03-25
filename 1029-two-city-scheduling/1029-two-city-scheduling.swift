class Solution {
    func twoCitySchedCost(_ costs: [[Int]]) -> Int {
        var diffs = [[Int]]() // the difference, costA, costB
        for cost in costs {
            diffs.append([cost[0] - cost[1], cost[0], cost[1]])
        }
        diffs.sort { $0[0] < $1[0] } // sort by the differenec
        var result = 0
        for i in 0..<diffs.count {
            if i < diffs.count/2 {
                result += diffs[i][1]
            } else {
                result += diffs[i][2]
            }
        }
        return result
    }
}