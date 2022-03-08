class Solution {
    func rotate(_ matrix: inout [[Int]]) {
        let n = matrix.count
        var left = 0
        var right = n-1
        
        while left < right {
            var top = left
            var bottom = right
            
            for i in 0..<(right-left) {
                let topLeft = matrix[top][left+i]
                matrix[top][left+i] = matrix[bottom-i][left]
                matrix[bottom-i][left] = matrix[bottom][right-i]
                matrix[bottom][right-i] = matrix[top+i][right]
                matrix[top+i][right] = topLeft
            }
            left += 1
            right -= 1
        }
    }
}