class Solution {
    func canAttendMeetings(_ intervals: [[Int]]) -> Bool {
        // sort by start time
        guard intervals.count > 1 else { return true }
        var sorted = intervals.sorted(by: { $0[0] < $1[0] })
        
        // [0                 30]  
        //    [5,10]  [15,20] 
        //
        
        //          [7,10]
        // [2,4]]
        
        for i in 0..<sorted.count-1 {
            //
            if sorted[i][1] > sorted[i+1][0] {
                return false
            }
        }
        
        return true
    }
}