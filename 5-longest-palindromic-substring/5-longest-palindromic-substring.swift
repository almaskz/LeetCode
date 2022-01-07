class Solution {
    func longestPalindrome(_ s: String) -> String {
        var n = s.count
        var dp = Array(repeating: Array(repeating: false, count: n), count: n)
        var aL = 0
        var aR = 0
        var arr = Array(s)
        
        for i in stride(from: n-1, through: 0, by: -1) {
            for j in i..<n {
                if arr[j] == arr[i] && (j-i < 3 || dp[i+1][j-1]) {
                    dp[i][j] = true
                    if j-i > aR-aL {
                        aL = i
                        aR = j
                    }
                }
            }
        }
        
        return String(arr[aL...aR])
    }
}