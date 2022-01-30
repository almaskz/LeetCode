class Solution {
    func eraseOverlapIntervals(_ intervals: [[Int]]) -> Int {
        // sort by the start 
        var sorted = intervals.sorted { $0[0] < $1[0] }
        
        //[[1,2],[2,3],[3,4],[1,3]]
        /*
          [1 2]
          [1    3]
          [  2  3]
               [3  4]
            
           i
        */
        
        var count = 0 
        var pre = sorted[0]
        for i in 1..<sorted.count {
            var cur = sorted[i]
            
            // if no overlap (pre-end time <= cur-start time)
            if pre[1] <= cur[0] {
                pre = cur
            } else {
                count += 1
                // take greedily the smaller end time, 
                // thus there is a less chance of the overlap in the future 
                if cur[1] < pre[1] {
                    pre = cur
                }
            }
        }
        return count
    }
}