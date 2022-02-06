class Solution {
    func minMeetingRooms(_ intervals: [[Int]]) -> Int {
        //[ 0                30]
        //    [5,10],
        //            [15,20]]
        
        // 0  5 15
        //        l
        // 10 20 30
        //         r 
        // count = 2
        // max = 2 
        
        
        // sort by start time 
        var sortedStart = intervals.map { $0[0] }.sorted()
        var sortedEnd = intervals.map { $0[1] }.sorted()
        
        var l = 0
        var r = 0
        var count = 0
        var minMeetingRooms = 0
        while l < sortedStart.count && r < sortedEnd.count {
            if sortedStart[l] < sortedEnd[r] {
                l += 1
                count += 1
                minMeetingRooms = max(count, minMeetingRooms)
            } else {
                r += 1
                count -= 1
            }
        }
        return minMeetingRooms
    }
}