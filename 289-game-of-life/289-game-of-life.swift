class Solution {
    func gameOfLife(_ board: inout [[Int]]) {
        // 0 -> 0 = 0
        // 1 -> 0 = 1
        // 0 -> 1 = 2
        // 1 -> 1 = 3 
        let row = board.count
        let col = board[0].count
        
        for i in 0..<row {
            for j in 0..<col {
                let nei = countNei(i, j, row, col, board)
                if board[i][j] == 1 {
                    if nei < 2 {
                        board[i][j] = 1
                    } else if nei == 2 || nei == 3 {
                        board[i][j] = 3
                    } else {
                        board[i][j] = 1
                    }
                } else if nei == 3 {
                    board[i][j] = 2
                }
            }
        }
        
        for i in 0..<row {
            for j in 0..<col {
                if board[i][j] == 1 {
                    board[i][j] = 0
                } else if board[i][j] == 2 {
                    board[i][j] = 1
                } else if board[i][j] == 3 {
                    board[i][j] = 1
                }
            }
        }
    }
    
    func countNei(_ row: Int, _ col: Int,
                  _ kRow: Int, _ kCol: Int,
                  _ board:[[Int]]) -> Int {        
        let directions = [(-1,-1), (-1,0), (0,-1), (-1,1), (1,-1), (1,0), (1,1), (0,1)]
        var count = 0
        for dir in directions {
            let x = row + dir.0
            let y = col + dir.1
            if x >= 0 && x < kRow && y >= 0 && y < kCol {
                if board[x][y] == 1 || board[x][y] == 3 {
                    count += 1
                } 
            }
        }
        return count
    }
}