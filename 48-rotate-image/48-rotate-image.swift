class Solution {
    func rotate(_ matrix: inout [[Int]]) {
        var left = 0
        var right = matrix.count - 1
        
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

/*
[[9,4,7],
 [8,5,2],
 [3,6,1]]

*/