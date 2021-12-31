class Solution {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        var arr = Array(word)
        var grid = board
        for i in 0..<board.count {
            for j in 0..<board[i].count {
                if board[i][j] == arr[0] {
                    if dfs(&grid, i, j, arr, 0) {
                        return true
                    }
                }
            }
        }
        
        return false
    }
    
    func dfs(_ arr: inout [[Character]], _ i: Int, _ j: Int, _ word: [Character], _ index: Int) -> Bool {
        let tmp = arr[i][j]
        arr[i][j] = "#"
        if index == word.count - 1 {
            if word[index] == tmp {
                return true
            } else {
                return false
            }
        }
        for dir in [(0,1), (1,0), (-1, 0), (0,-1)] {
            let x = i + dir.0
            let y = j + dir.1
            if x >= 0 && x < arr.count && 
               y >= 0 && y < arr[x].count && 
               arr[x][y] == word[index+1] {
                if dfs(&arr, x, y, word, index+1) {
                    return true
                }
            }
        }
        arr[i][j] = tmp
        return false
    }
    
    /*
    word = "ABCB"
    [["A","B","C","E"],
     ["S","F","C","S"],
     ["A","D","E","E"]], 
    
    */

}