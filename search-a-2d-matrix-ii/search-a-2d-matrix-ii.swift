class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        var maxR = matrix.count
        var maxC = matrix[0].count
        
        var row = 0
        var colm = maxC-1
        
        while row < maxR && colm >= 0 {
            if target > matrix[row][colm] {
                row += 1
            } else if target < matrix[row][colm] {
                colm -= 1
            } else {
                return true
            }
        }
        return false
    }
}