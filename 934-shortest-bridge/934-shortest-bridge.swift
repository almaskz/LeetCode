class Solution {
    private struct GridPoint: Hashable {
        var row: Int
        var col: Int
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(row)
            hasher.combine(col)
        }
        
        static func == (lhs: GridPoint, rhs: GridPoint) -> Bool {
            return lhs.row == rhs.row && lhs.col == rhs.col
        }
    }
    
    func shortestBridge(_ grid: [[Int]]) -> Int {
        // outline:
        // find 1st land cell 
        // run DFS to get all the cells related to this island
        // from island run bfs layer by layer until we reach the other land cell
        // inclrement distance each layer
        
        let size = grid.count
        let island1 = getIsland(grid) 
        //myPrint(island1)
        
        var queue = Array(island1)
        var visited = island1
        var distance = 0 
        
        while(queue.isEmpty == false) {
            var nextLevel = [GridPoint]()
            for cur in queue {
                for dir in [(0,1), (1,0), (0,-1), (-1,0)] {
                    let x = cur.row + dir.0
                    let y = cur.col + dir.1 
                    if x >= 0 && x < size && y >= 0 && y < size {
                        let point = GridPoint(row: x, col: y)
                        if visited.contains(point) {
                            continue
                        }
                        if grid[x][y] == 1 {
                            return distance
                        }
                        nextLevel.append(point)
                        visited.insert(point)
                    }
                }
            }
            queue = nextLevel
            distance += 1
        }
        
        return distance
    }
    
    private func getIsland(_ grid: [[Int]]) -> Set<GridPoint> {
        var size = grid.count 
        var visited = Array(repeating: Array(repeating: false, count: size), count: size)
        var curIsland = Set<GridPoint>()
        for i in 0..<grid.count {
            for j in 0..<grid[0].count {
                if grid[i][j] == 1 {
                    dfs(i, j, &visited, grid, &curIsland)
                    return curIsland
                }
            }
        }
        return curIsland
    }
    
    private func dfs(_ row: Int, _ col: Int, _ visited: inout [[Bool]], _ grid: [[Int]], _ island: inout Set<GridPoint>) {
        visited[row][col] = true   
        island.insert(GridPoint(row: row, col: col))
        
        
        for dir in [(0,1), (1,0), (0,-1), (-1,0)] {
            let x = row + dir.0
            let y = col + dir.1 
            if x < 0 || x == grid.count || y < 0 || y == grid[0].count {
                continue
            } 
            if visited[x][y] {
                continue
            }
            if grid[x][y] == 1 {
                dfs(x, y, &visited, grid, &island)          
            } else {
                visited[x][y] = true
            }
        }
    }
}