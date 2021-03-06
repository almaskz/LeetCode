class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        var arr = grid
        var numOfIslands = 0
        
        for i in 0..<arr.count {
            for j in 0..<arr[i].count {
                if arr[i][j] == Character("1") {
                    numOfIslands += 1 
                    //dfs(i, j, &arr)
                    bfs(i, j, &arr)
                }
            }
        }
        return numOfIslands
    }
    
    func bfs(_ x: Int, _ y: Int, _ grid: inout [[Character]]) {
        var stack = [[Int]]()
        stack.append([x, y])
    
        while stack.isEmpty == false {
            var point = stack.removeLast()
            let pointX = point[0]
            let pointY = point[1]
            grid[pointX][pointY] = Character("0")
            for dir in [(0,1), (1,0), (0,-1), (-1,0)] {
                let row = pointX + dir.0
                let colm = pointY + dir.1
                if  row >= 0 && row < grid.count &&
                    colm >= 0 && colm < grid[0].count && 
                    grid[row][colm] == Character("1") {
                        stack.append([row, colm])
                }
            }
        }
    }
    
    func dfs(_ x: Int, _ y: Int, _ grid: inout [[Character]]) {
        grid[x][y] = Character("0")
        
        for dir in [(0,1), (0,-1), (1,0), (-1,0)] {
            let row = x + dir.0
            let colm = y + dir.1
            let char = Character("1")
            if row >= 0 && row < grid.count &&
                colm >= 0 && colm < grid[0].count && 
                grid[row][colm] == char {
                    dfs(row, colm, &grid)
            }
        }
    }
}