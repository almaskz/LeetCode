class Solution {
    func setZeroes(_ matrix: inout [[Int]]) {
        var topRow = false 
        
        for row in 0..<matrix.count {
            for col in 0..<matrix[0].count {
                if matrix[row][col] == 0 {
                    if row == 0 {
                        topRow = true
                    } else {
                        matrix[row][0] = 0    
                    } 
                    matrix[0][col] = 0
                }        
            }
        }
        
        // check cols
        for row in 1..<matrix.count {
            for col in 1..<matrix[0].count {
                if matrix[0][col] == 0 || matrix[row][0] == 0 {
                    matrix[row][col] = 0
                }  
            }
        }
        
        // handle 1st col
        if matrix[0][0] == 0 {
            for row in 0..<matrix.count {
                matrix[row][0] = 0
            }
        }
        
        if topRow {
            for col in 0..<matrix[0].count {
                matrix[0][col] = 0
            }
        }
    }
}