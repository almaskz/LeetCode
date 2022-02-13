class Solution {
    func totalNQueens(_ n: Int) -> Int {
        var count = 0
        var colms = Set<Int>()      // for columns where we place queens
        var negDs = Set<Int>()      // negative diagonals (row - col) 
        var posDs = Set<Int>()      // positive diagonals (row + col)
        
        func backtrackQueens(_ row: Int) {
            if row == n {
                count += 1
                return
            }
            // iterate throught col in cur row
            for col in 0..<n {
                if isNotUnderAttack(row, col) {
                    placeQueen(row, col)
                    backtrackQueens(row+1)
                    removeQueen(row, col)
                }
            }
        }
        
        
        func isNotUnderAttack(_ row: Int, _ col: Int) -> Bool {
            return !colms.contains(col) && !negDs.contains(row-col) && !posDs.contains(row+col)
        }
        
        func placeQueen(_ row: Int, _ col: Int) {
            colms.insert(col)
            negDs.insert(row-col)
            posDs.insert(row+col)
        }
        
        func removeQueen(_ row: Int, _ col: Int) {
            colms.remove(col)
            negDs.remove(row-col)
            posDs.remove(row+col)
        }
        
        backtrackQueens(0)
        return count
    }
    
    
}