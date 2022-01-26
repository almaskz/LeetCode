class Solution {
    func pacificAtlantic(_ heights: [[Int]]) -> [[Int]] {
        /*
        pacific
        [[1,2,2,3,5],
         [3,2,3,4,4],
         [2,4,5,3,1],
         [6,7,1,4,5],
         [5,1,1,2,4]]
            atlantic
        */
        // 1) dfs from every top and left border cell 
        //      and mark cells that are reachable true for pacific ocean
        // 2) dfs from every bottom and right border cell
        //      and mark cells taht are reachable true for atlantic ocean
        // 3) pacific[row][col] && atlantic[row][col] make to the result
        
        let row = heights.count
        let colm = heights[0].count
        
        var pacific = Array(
            repeating: Array(repeating: false, count: colm),
            count: row)
        var atlantic = pacific
        
        
        for i in 0..<row {
            for j in 0..<colm {
                if i == 0 || j == 0 {
                    dfs(i, j, heights, &pacific)
                }
                if i == row-1 || j == colm-1 {
                    dfs(i, j, heights, &atlantic)
                }
            }
        }
        
        var result = [[Int]]()
        for i in 0..<row {
            for j in 0..<colm {
                if pacific[i][j] && atlantic[i][j] {
                    result.append([i, j])
                }
            }
        }
        return result
    }
    
    // visited[x][y] => cannot flow  - false, 
    //                  can flow - true 
    func dfs(_ row: Int, _ col: Int, _ heights: [[Int]], _ visited: inout [[Bool]]) {
        visited[row][col] = true
        
        for dir in [(0,1), (1,0), (0,-1), (-1,0)] {
            let x = row + dir.0
            let y = col + dir.1
            if x >= 0 && x < heights.count && 
                y >= 0 && y < heights[0].count && 
                visited[x][y] == false && heights[row][col] <= heights[x][y] {
                    dfs(x, y, heights, &visited)
            }
        }
    }
}