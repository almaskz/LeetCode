class Solution {
    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        // [1 2] [3  5] [6   9] [10 20] 
        //         [4      7]
        //                       i 
        //
        // newIntervals = [ [1 2] [3 9] ]
        
        guard intervals.count > 0 else { return [newInterval] }
        
        var newIntervals = [[Int]]()
            
        var i = 0
        var didAppend = false
        
        //
        while i < intervals.count {
            var cur = intervals[i]

            
            if didAppend == false && cur[0] > newInterval[1] {
                // edge case
                newIntervals.append(newInterval)
                newIntervals.append(cur)
                i += 1
                didAppend = true
            } else if didAppend == false && newInterval[0] <= cur[1] {
                // new need to insert    
                let minStart = min(cur[0], newInterval[0])
                var maxEnd = max(cur[1], newInterval[1])
                
                i += 1
                // get all ends for overlapping intervals
                while i < intervals.count && intervals[i][0] <= maxEnd {
                    maxEnd = max(intervals[i][1], maxEnd)
                    i += 1
                }
                newIntervals.append([minStart, maxEnd])
                didAppend = true
            } else {
                newIntervals.append(cur)
                i += 1
            }
        }
        
        if didAppend == false {
            newIntervals.append(newInterval)
        }
        
        return newIntervals
    }
}