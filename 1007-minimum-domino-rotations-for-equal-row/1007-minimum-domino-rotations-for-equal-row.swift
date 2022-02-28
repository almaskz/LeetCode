class Solution {
    func minDominoRotations(_ tops: [Int], _ bottoms: [Int]) -> Int {
        let resultT = check(tops[0], tops, bottoms)
        let resultB = check(bottoms[0], tops, bottoms)
        
        if resultT == -1 && resultB == -1 {
            return -1 
        } else if resultT == -1 || resultB == -1 {
            return resultT == -1 ? resultB : resultT
        } else {
            return min(resultT, resultB)
        }
    }
    
    func check(_ target: Int, _ tops: [Int], _ bottoms: [Int]) -> Int {
        var topMissing = 0, bottomMissing = 0
        for i in 0..<tops.count {
            if tops[i] != target && bottoms[i] != target {
                return -1
            }
            if tops[i] != target {
                topMissing += 1
            }
            if bottoms[i] != target {
                bottomMissing += 1
            }
        }
        return min(topMissing, bottomMissing)
    }
}