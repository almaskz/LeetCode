class Solution {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        let total = matrix.count * matrix[0].count
        var result = [Int]()
        result.reserveCapacity(total)
        
        var left = 0
        var top = 0
        var right = matrix[0].count - 1
        var bottom = matrix.count - 1
        
        while result.count < total {
            // go from right to left
            for i in stride(from: left, through: right, by: 1) where result.count < total {
                result.append(matrix[top][i])
                //print("1: \(matrix[top][i])")
            }
            top += 1
            
            // go top to down
            for i in stride(from: top, through: bottom, by: 1) where result.count < total  {
                result.append(matrix[i][right])
                //print("2: \(matrix[i][right])")
            }
            right -= 1
            
            // go left to right
            for i in stride(from: right, through: left, by: -1) where result.count < total  {
                result.append(matrix[bottom][i])
                //print("3: \(matrix[bottom][i])")
            }
            bottom -= 1
            
            // go bottom to up
            for i in stride(from: bottom, through: top, by: -1) where result.count < total  {
                result.append(matrix[i][left])
                //print("4: \(matrix[i][left])")
            }
            left += 1
        }
        
        return result
    }
}

/*
[[1,2,3,4],
 [5,6,7,8],
[9,10,11,12]]
*/