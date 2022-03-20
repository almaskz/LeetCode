class Solution {
    func shortestPathBinaryMatrix(_ grid: [[Int]]) -> Int {
        // BFS
        // distance variable to keep track of lenth (levles)
        // - check is cell is n-1 and n-1 we return distance
        // - return -1
        // TC: O(V+E) -> V - n*n and E - O(8*n*n) -> O(n*n)
        // SC: O(V) -> O(n*n)
        
        var visited = grid
        var distance = 0
        let kN = grid.count
        
        /*
        [[1,1,1],
         [1,1,1],
         [1,1,0]]
        
        queue = [(1,2), (2,2)]
        */
        
        var queue = [(row: Int, col: Int)]()
        queue.append((row: 0, col: 0))
        
        while queue.isEmpty == false {                      // (1,0) (1,1),(0,1)
            var nextLevel = [(row: Int, col: Int)]()        
            
            for cur in queue {
                if visited[cur.row][cur.col] != 0  {
                    continue
                }
                visited[cur.row][cur.col] = 1   //     

                if cur.row == kN-1 && cur.col == kN-1 {
                    return distance + 1
                }

                for dir in [(-1, 0),(0,-1),(1,0),(0,1),(1,1),(-1,-1),(1,-1),(-1,1)] {
                    let x = cur.row + dir.0
                    let y = cur.col + dir.1
                    if x >= 0 && x < kN && 
                        y >= 0 && y < kN && 
                        visited[x][y] == 0 {

                        nextLevel.append((row: x, col: y))      // (0,1) | (0,2), (1,2) | (1,2) | (2,2)
                    } 
                }
            }
            queue = nextLevel
            distance += 1
        }
        
        return -1
    }
}