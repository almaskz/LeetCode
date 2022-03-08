class Solution {
    func setZeroes(_ matrix: inout [[Int]]) {
        let kRows = matrix.count
        let kCols = matrix[0].count
        
        var zeroFirstRow = false
        
        for row in 0..<kRows {
            for col in 0..<kCols {
                if matrix[row][col] == 0 {
                    matrix[0][col] = 0
                    if row > 0 {
                        matrix[row][0] = 0
                    } else {
                        zeroFirstRow = true
                    }
                }
            }
        }
        
        for row in 1..<kRows {
            for col in 1..<kCols {
                if matrix[0][col] == 0 || matrix[row][0] == 0 {
                    matrix[row][col] = 0
                }       
            }
        }
        
        // handle 1st col
        if matrix[0][0] == 0 {
            for row in 0..<kRows {
                matrix[row][0] = 0
            }
        }
        if zeroFirstRow {
            for col in 0..<kCols {
                matrix[0][col] = 0
            }
        }
    }
}