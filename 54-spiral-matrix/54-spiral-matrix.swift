class Solution {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        let m = matrix.count
        let n = matrix[0].count
        var left = 0
        var right = matrix[0].count-1
        var top = 0
        var bottom = matrix.count-1
        
        var result = [Int]()
        result.reserveCapacity(m*n)
        
        // left = 0
        // right = 1
        // top = 1
        // bottom = 2
        // [1 2 3 6 9]
        while top <= bottom && left <= right {       
            for i in stride(from: left, through: right, by: 1) {             // 0..2 | 
                result.append(matrix[top][i])
            }
            top += 1
            
            for i in stride(from: top, through: bottom, by: 1) {             // 1..2 |
                result.append(matrix[i][right])
            }
            right -= 1                          
            
            guard top <= bottom && left <= right else { break }
            
            for i in stride(from: right, through: left, by: -1) {
                result.append(matrix[bottom][i])
            }
            bottom -= 1
            
            for i in stride(from: bottom, through: top, by: -1) {
                result.append(matrix[i][left])
            }
            left += 1
        }
        return result
    }
}