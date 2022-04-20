class Solution {
    func shiftGrid(_ grid: [[Int]], _ k: Int) -> [[Int]] {
        // [1] 2 3
        //  4 5 6
        //  7 8 9] 
        //  === 
        //  1 1 2
        //  4 5 6
        //  7 8 9] 
        let kRow = grid.count
        let kCol = grid[0].count
        var ans = grid
        
        for i in 0..<kRow {
            for j in 0..<kCol {
                let index = convertFrom2DTo1D(i, j, kRow, kCol)
                let newIndex = (index + k) % (kRow*kCol)
                let dir = convetFrom1DTo2D(newIndex, kRow, kCol)
                ans[dir.row][dir.col] = grid[i][j]
            }
        }
        
        return ans
    }
    
    // (0,0) -> 0
    // (0,1) -> 1
    // (0,2) -> 2
    func convertFrom2DTo1D(_ row: Int, _ col: Int, _ kRow: Int, _ kCol: Int) -> Int {
        return row * kCol + col
    }
    
    // 1 -> (0, 1)
    // 2 -> (0, 2)
    // 3 -> (1, )
    func convetFrom1DTo2D(_ index: Int, _ kRow: Int, _ kCol: Int) -> (row: Int, col: Int) {
        return (row: index / kCol, col: index % kCol)
    }
}