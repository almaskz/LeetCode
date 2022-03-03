class Solution {
    private func getAvailLand(_ grid: [[Int]]) -> [(row: Int, col: Int)] {
        var availLand = [(row: Int, col: Int)]()
        
        for i in 0..<grid.count {
            for j in 0..<grid[i].count {
                if grid[i][j] == 0 {
                    availLand.append((row: i, col: j))
                }
            }
        }
        
        return availLand
    }
    
    private func getNumOfBuilding(_ grid: [[Int]]) -> Int {
        var count = 0
        for i in 0..<grid.count {
            for j in 0..<grid[i].count {
                if grid[i][j] == 1 {
                    count += 1
                }
            }
        }
        return count
    }
    
    private func distancesToBuildings(_ pos: (row: Int, col: Int), 
                                      _ grid: [[Int]]) -> [Int] {
        var distances = [Int]()
        
        var kRows = grid.count
        var kCols = grid[0].count
        var visited = Array(
            repeating: Array(repeating: false, count: kCols), 
            count: kRows
        )
        
        var queue = [pos]
        visited[pos.row][pos.col] = true 
        var curDist = 1
        while queue.isEmpty == false {
            var next = [(row: Int, col: Int)]()           
            for item in queue {
                for dir in [(0, 1), (0, -1), (1, 0), (-1, 0)] {
                    let x = item.row + dir.0
                    let y = item.col + dir.1
                    if x >= 0 && x < kRows &&
                       y >= 0 && y < kCols && 
                       visited[x][y] == false && 
                       grid[x][y] != 2 {
                        visited[x][y] = true
                        if grid[x][y] == 1 {
                            distances.append(curDist)        
                        } else {
                            next.append((row: x, col: y))
                        }
                    }
                }
            }
            curDist += 1
            queue = next
        }
        return distances
    }
    
    func shortestDistance(_ grid: [[Int]]) -> Int {
        // get lands
        let lands = getAvailLand(grid)
        guard lands.count > 0 else { return -1 }
        
        // get number of buildings
        let totalNumOfBuildings = getNumOfBuilding(grid)
        // run bfs on lands and array of distances to the buildings
        // check the number of distances to match to the # of buildings
        // if ok -> sumDistances and add to array landToBuildingDistances
        // find min in that array of landToBuildingDistances
        // of empty return -1
        
        var minSoFar = Int.max
        for land in lands {
            let landToBuildingDistances = distancesToBuildings(land, grid)
            if landToBuildingDistances.count == totalNumOfBuildings {
                let sum = landToBuildingDistances.reduce(0, +)
                minSoFar = min(minSoFar, sum)
            }
        }
        return minSoFar == Int.max ? -1 : minSoFar
    }
}