class Solution {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        let kN = matrix.count
        let kM = matrix[0].count
        var top = 0
        var left = 0
        var bottom =  kN-1
        var right = kM-1
        if bottom == 0 {
            return matrix[0]
        }
        if right == 0 {
            var ans = [Int]()
            for row in matrix {
                ans.append(row[0])
            }
            return ans
        }
        var ans = [Int]()
        ans.reserveCapacity(kN*kM)
        
        // top = 1
        // left = 0
        // bottom = 1
        // right = 2
        // ans = [1, 2, 3, 4, 8, 12, 11, 10, 9 ]
        while top <= bottom || left <= right {    // 
            for i in stride(from: left, through: right, by: 1) {    // 0...3
                ans.append(matrix[top][i])    
            }
            top += 1
            for i in stride(from: top, through: bottom, by: 1) {    // 1..2
                ans.append(matrix[i][right])    //
            }
            right -= 1
            if ans.count == kN*kM {
                break
            }
            for i in stride(from: right, through: left, by: -1) {   // 2..0
                ans.append(matrix[bottom][i])       
            }
            bottom -= 1
            for i in stride(from: bottom, through: top, by: -1) {   // 1, 1
                ans.append(matrix[i][left])
            }
            left += 1
            if ans.count == kN*kM {
                break
            }
            
        }
        return ans
    }
}