class Solution {
    func longestPalindrome(_ s: String) -> String {
        var n = s.count
        var arr = Array(s)
        var memo = Array(repeating: Array(repeating: false, count: n), count: n)
        var aLeft = 0
        var aRight = 0
        
        for i in stride(from: n-1, through: 0, by: -1) {
            for j in i..<n {
                if arr[i] == arr[j] && 
                    (j-i < 3 || memo[i+1][j-1]) {
                        memo[i][j] = true
                        if j - i > aRight - aLeft {
                            aLeft = i
                            aRight = j
                        } 
                }
            }
        }
        return String(arr[aLeft...aRight])
    }
}