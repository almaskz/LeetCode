class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        // sort by the start time
        var sorted = intervals.sorted(by: {$0[0] < $1[0]} )
        
        var merged = [[Int]]()
        
        // 0[1   3] 
        // 1[1      5]
        //     2[2    6]     3[8,10]   4[15,18]
        //   i = 0
        
        var i = 0 
        while i < sorted.count {
            var cur = sorted[i]         // [15 18]

            // 0 < 4 && 3 >= 1
            // 1 < 4 && 5 >= 2
            // 2 < 4 && 6 >= 8
            // 3 < 4 && 10 >= 15
            while i < sorted.count-1 && cur[1] >= sorted[i+1][0] {
                cur[1] = max(cur[1], sorted[i+1][1])    // cur = [1 6]
                i += 1                                  // i = 2
            }
            merged.append(cur)                          // [1 6] [8 10]
            i += 1                                      // i = 4
        }
        
        return merged
    }
}