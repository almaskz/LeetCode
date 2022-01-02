class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        // loop grid util first 1 is found
        // numOfIslands += 1
        // dfs(from it)  
        var arr = grid
        var numOfIslands = 0
        for i in 0..<arr.count {
            for j in 0..<arr[i].count {
                if arr[i][j] == "1" {
                    numOfIslands += 1
                    dfs(i, j, &arr)
                }
            }
        }
        
        return numOfIslands
    }
    
    func dfs(_ row: Int, _ col: Int, _ grid: inout [[Character]]) {
        grid[row][col] = Character("0")
        for dir in [(0,1), (0, -1), (1,0), (-1, 0)] {
            let x = dir.0 + row
            let y = dir.1 + col
            if (x >= 0 && x < grid.count && 
                y >= 0 && y < grid[row].count && grid[x][y] == "1") {    
                dfs(x, y, &grid)
            }
        }
    }
}