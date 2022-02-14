class Solution {
    var n: Int = 0
    var result: [String] = []
    /*
    0,0
    [( )]
     i
    
    cur = [(]
    1,0
    [( )]
     i
    cur = [((]
    2,0
    [( )]
     i
    cur = [(((]
    3, 0
    [)]
     i
    cur = [((()]
    3, 1
    [)]
     i
    cur = [((())]
    
    
    */
    func generateParenthesis(_ n: Int) -> [String] {
        self.n = n
        result = []
        var cur = [String]()
        backtrack(&cur, 0, 0)
        return result
    }
    
    func backtrack(_ cur: inout [String], _ open: Int, _ close: Int) {
        if open == n && close == n {
            result.append(cur.joined())
            return
        }
        
        if open < n {
            cur.append("(")
            backtrack(&cur, open+1, close)
            cur.removeLast()
        }
        
        if close < open {
            cur.append(")")
            backtrack(&cur, open, close+1)
            cur.removeLast()
        }
        // iterate throught all candidates
        // add
        // backtrack
        // remove
    }
    
    func validCandidates(_ open: Int, _ close: Int) -> [String] {
        if open < n {
            return ["(", ")"]
        } else if close < n {
            return [")"]
        } else {
            return []
        }
    } 
}