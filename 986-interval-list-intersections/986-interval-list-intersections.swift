class Solution {
    func intervalIntersection(_ firstList: [[Int]], _ secondList: [[Int]]) -> [[Int]] {
        // [[0  2][3 4][5     10]    [13    23][24   25]]
        // [  [1        5],[8     12],    [15    24] [25,26]]
        //                1
        //      2
        //  [    ]
        //   [ ]
        // if end1 >= start2 && start1 <= start2 overlap (1,2)
        // if start1 <= end2 && start1 >= start2 overlap (3,4)
        // 
        // if overlap => take max(start1, start2) and min(end1, end2)
        //   [1 2] -> [3 5] -> 
        var i = 0,  j = 0
        
        var result = [[Int]]()
        while i < firstList.count && j < secondList.count {
            let interval1 = firstList[i]
            let interval2 = secondList[j]
            var isOverlap = false
            if interval1[1] >= interval2[0] && interval1[0] <= interval2[0] {
                isOverlap = true
            } 
            if interval1[0] <= interval2[1] && interval1[0] >= interval2[0] {
                isOverlap = true
            }
            
            if isOverlap {
                let overlap = [max(interval1[0], interval2[0]), 
                               min(interval1[1], interval2[1])]
                result.append(overlap)
            }
            
            if interval1[1] > interval2[1] {
                j += 1
            } else {
                i += 1
            }
        }
        return result
    }
}