class Solution {
    func findBuildings(_ heights: [Int]) -> [Int] {
        var ans = [heights.count-1]
        var maxSoFar = heights[heights.count-1]
        for i in stride(from: heights.count-2, through: 0, by: -1) {
            if heights[i] > maxSoFar {
                ans.append(i)
                maxSoFar = heights[i]
            }
        }
        return ans.reversed()
    }
}