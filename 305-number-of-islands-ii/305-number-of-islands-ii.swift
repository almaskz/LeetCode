class Solution {
    func numIslands2(_ m: Int, _ n: Int, _ positions: [[Int]]) -> [Int] {
        var matrix = Array(repeating: Array(repeating: 0, count: n), count: m)
        var result = [Int]()
        
        /*
        [110]
        [010]
        [022]
        */
        var setOfLandDigits = Set<Int>()
        
        for item in positions {
            let row = item[0]
            let col = item[1]
            if matrix[row][col] != 0 {
                result.append(setOfLandDigits.count)
                continue
            }
            let unique = countUniqueNei(matrix, row, col)
            
            if unique.count == 0 {
                let cur = (setOfLandDigits.max() ?? 0) + 1
                setOfLandDigits.insert(cur)
                matrix[row][col] = cur
            } else if unique.count == 1 {
                matrix[row][col] = unique.first!
            } else {
                let color = unique.first!
                setOfLandDigits = setOfLandDigits.subtracting(unique)
                setOfLandDigits.insert(color)
                colorLand(&matrix, row, col, color)
            }
            result.append(setOfLandDigits.count)
        }
        
        return result
    }
    
    func colorLand(_ grid: inout [[Int]], _ row: Int, _ col: Int, _ color: Int) {
        grid[row][col] = color
        
        for dir in [(0,1), (1,0), (0,-1), (-1,0)] {
            let x = row + dir.0 
            let y = col + dir.1
            if x >= 0 && x < grid.count && y >= 0 && y < grid[0].count &&
                grid[x][y] != 0 && grid[x][y] != color {
                colorLand(&grid, x, y, color)
            }
        }
    }
    
    func countUniqueNei(_ grid: [[Int]], _ row: Int, _ col: Int) -> Set<Int> {
        var set = Set<Int>()
        // left
        if col - 1 >= 0 && grid[row][col-1] != 0 {
            set.insert(grid[row][col-1])
        }
        // right
        if col + 1 < grid[0].count && grid[row][col+1] != 0 {
            set.insert(grid[row][col+1])
        }
        // top
        if row - 1 >= 0 && grid[row-1][col] != 0 {
            set.insert(grid[row-1][col])
        }
        // bottom
        if row + 1 < grid.count && grid[row+1][col] != 0 {
            set.insert(grid[row+1][col])
        }
        return set
    }
}