class Solution {
    func wallsAndGates(_ rooms: inout [[Int]]) {
        var queue = [(row: Int, col: Int)]()
        var visited = Array(repeating: Array(repeating: 0, count: rooms[0].count), count: rooms.count)
        // get all gates
        for i in 0..<rooms.count {
            for j in 0..<rooms[i].count {
                if rooms[i][j] == 0 {
                    queue.append((row: i, col: j))
                    visited[i][j] = 1
                }
            }
        }
        
        var distance = 1
        // bfs
        while queue.isEmpty == false {
            var next = [(row: Int, col: Int)]()
            for item in queue {
                addRoom(&next, &rooms, item, &visited, distance)
            }
            distance += 1
            queue = next
        }
    }
    
    func addRoom(_ next: inout [(row: Int, col: Int)], _ rooms: inout [[Int]], _ cur: (row: Int, col: Int), _ visited: inout [[Int]], _ distance: Int) {
        var kRows = rooms.count
        var kCols = rooms[0].count
        
        for dir in [(0, 1), (1, 0), (0, -1), (-1, 0)] {
            let x = cur.row + dir.0
            let y = cur.col + dir.1
            let item = (row: x, col: y)
            if x >= 0 && x < kRows && y >= 0 && y < kCols &&
                visited[x][y] == 0 && 
                rooms[x][y] != -1 {
                    rooms[x][y] = distance
                    visited[x][y] = 1
                    next.append(item)
            }
        }
    }
    
    
}