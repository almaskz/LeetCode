class Solution {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        var board = board
        var arr = Array(word)
        for row in 0..<board.count {
            for col in 0..<board[0].count {
                if backtracking(0, arr, &board, row, col) {
                    return true
                }
            }
        }
        return false
    }
    
    func backtracking(_ index: Int, _ word: [Character], 
                      _ board: inout [[Character]],
                      _ row: Int, _ col: Int) -> Bool {
        if index == word.count {
            return true
        }
        guard row >= 0 && row < board.count else { return false }
        guard col >= 0 && col < board[0].count else { return false }
        guard board[row][col] == word[index] else { return false }
        
        // mark visited
        board[row][col] = "#"
        for dir in [(0,1), (0,-1), (1,0), (-1,0)] {
            let x = row + dir.0
            let y = col + dir.1
            if backtracking(index + 1, word, &board, x, y) {
                return true
            }
        }
        // put back
        board[row][col] = word[index]
        return false
    }
}