
class NumMatrix {
    
    private var prefix: [[Int]]

    init(_ matrix: [[Int]]) {
        let row = matrix.count
        let col = matrix[0].count
        prefix = Array(repeating: Array(repeating: 0, count: col + 1), count: row + 1)
        
        for r in 0..<row {
            var pre = 0
            for c in 0..<col {
                pre += matrix[r][c]
                let above = prefix[r][c+1]
                prefix[r+1][c+1] = above + pre
            }
        }
    }
    
    func sumRegion(_ row1: Int, _ col1: Int, _ row2: Int, _ col2: Int) -> Int {
        let sum = prefix[row2+1][col2+1]
        let top = prefix[row1][col2+1]
        let left = prefix[row2+1][col1]
        let topLeft = prefix[row1][col1]
        return sum - top - left + topLeft
    }
}

/**
 * Your NumMatrix object will be instantiated and called as such:
 * let obj = NumMatrix(matrix)
 * let ret_1: Int = obj.sumRegion(row1, col1, row2, col2)
 */