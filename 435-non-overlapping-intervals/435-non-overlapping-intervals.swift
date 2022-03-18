class Solution {
    func eraseOverlapIntervals(_ intervals: [[Int]]) -> Int {
        var sorted = intervals.sorted { $0[0] < $1[0] } // sort by start time   
        
        var prev = sorted[0]
        var counter = 0    
    
        for i in 1..<sorted.count {
            var cur = sorted[i]
            // check overlap
            if prev[1] > cur[0] {
                counter += 1
                // greedy way to pick the one with smaller end time
                if cur[1] < prev[1] {
                    prev = cur
                }
            } else {
                prev = cur   
            }
        }
        
        return counter
    }
}