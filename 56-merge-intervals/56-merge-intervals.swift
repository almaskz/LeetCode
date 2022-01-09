class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        guard intervals.count > 1 else { return intervals }
        
        var result = [[Int]]()
        result.reserveCapacity(intervals.count)
        
        // nlogn
        var sorted = intervals.sorted(by: { $0[0] < $1[0] })
        
        result.append(sorted[0])
        // n
        for i in 1..<sorted.count {
            if sorted[i][0] <= result[result.count-1][1] {
                result[result.count-1][1] = max(sorted[i][1], result.last![1])
            } else {
                result.append(sorted[i])
            }
        }
        return result
    }
}