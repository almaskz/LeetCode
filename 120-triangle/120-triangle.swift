class Solution {
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        var size = triangle.last!.count
        var dp = triangle.last!
    
        // dp = [9,10,10,3]
        
        // 2-> 0
        // 
        for i in stride(from: size-2, through: 0, by: -1) {
            // i = 2 -> [6 5 7]
            // i = 1 -> [3 4]
            for val in 0..<triangle[i].count {
                // dp[0] = 6 + min(4, 1) = 7 
                // dp[1] = 5 + min(1, 8) = 6
                // dp[2] = 7 + min(8, 3) = 10
                
                // dp[0] = 3 + min(7, 6) = 9
                // dp[1] = 4 + min(6, 10) = 10
                dp[val] = triangle[i][val] + min(dp[val], dp[val+1])
            }
        }
        
        return dp[0]
    }
    
    /*
    [
     0 1 2 3
 0  [2],
 1  [3,4],
 2  [6,5,7],
 3  [4,1,8,3]
    ]
    */
}