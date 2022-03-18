class Solution {
    func eraseOverlapIntervals(_ intervals: [[Int]]) -> Int {
        var counter = 0
        guard intervals.count > 1 else { return counter } 

        var arr = intervals.sorted(by:{ $0[0] < $1[0] })	// sort in-place by start time
        print(arr)
        var prev = 0 
        var cur = 1
        while cur < arr.count {
            // check for overlap
            if arr[cur][0] < arr[prev][1] {
            // pick smaller end time
                if arr[cur][1] < arr[prev][1] {
                    prev = cur
                }
                counter += 1
            } else {
                prev = cur
            }
            cur += 1
        }

        return counter
    }
}