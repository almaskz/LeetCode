class Solution {
    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        // [1 2] [3  5] [6   9] [10 20] 
        //         [4      7]
        //                       i 
        //
        // newIntervals = [ [1 2] [3 9] ]
        
        var new = newInterval
    
        var newIntervals = [[Int]]()
        
        for i in 0..<intervals.count {
            // append the new interval to the begining
            if new[1] < intervals[i][0] {
                newIntervals.append(new)
                return newIntervals + intervals[i..<intervals.count]
            } else if new[0] > intervals[i][1] {
                newIntervals.append(intervals[i])
            } else {
                let minStart = min(new[0], intervals[i][0])
                let maxEnd = max(new[1], intervals[i][1])
                new = [minStart, maxEnd]
            }
        }

        newIntervals.append(new)
        return newIntervals
    }
}