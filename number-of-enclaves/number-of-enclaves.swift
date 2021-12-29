class Solution {
    func numEnclaves(_ grid: [[Int]]) -> Int {
        var arr = grid
        for i in 0..<grid.count {
            for j in 0..<grid[i].count {
                if i == 0 || i == grid.count - 1 || j == 0 || j == grid[i].count - 1 {
                    if (arr[i][j] == 1) {
                        dfs(&arr, i, j)
                    }
                }
            }
        }
        var ans = 0
        for i in 0..<arr.count {
            for j in 0..<arr[i].count {
                   ans += arr[i][j]    
            }
        }
        return ans
    }
    
    func dfs(_ matrix: inout [[Int]], _ i: Int, _ j: Int) {
        matrix[i][j] = 0
        
        for dir in [(0,1), (1,0), (0,-1), (-1,0)] {
            let x = i + dir.0
            let y = j + dir.1
            if (x >= 0 && x < matrix.count && y >= 0 && y < matrix[0].count && matrix[x][y] == 1) {
                dfs(&matrix, x, y)
            }
        }
    }
}