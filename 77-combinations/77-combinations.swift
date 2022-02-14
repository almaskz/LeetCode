class Solution {
    var ans = [[Int]]()
    var n = 0
    var k = 0 
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        //n = 4, k = 2
        // 0 1 2 3
        //[1 2 3 4]
        // 12; 23;
        //
        // 13; 14
        // 23; 24;
        // 34
        self.n = n
        self.k = k
        var cur = [Int]()
        backtrack(1, &cur)
        
        return ans
    }
    
    // 1, 4, 2
    // 2, 4, 2
    // 3, 4, 2
    func backtrack(_ start: Int, _ cur: inout [Int]) {
        // if done 
        // return
        if cur.count == k {
            ans.append(cur)
            return
        }
        
        for i in start..<n+1 {
            cur.append(i)
            backtrack(i+1, &cur)
            cur.removeLast()
        }
        // itarate through all solutions
        // add the the answer
        // backtrack
        // remove if needed
    }
}