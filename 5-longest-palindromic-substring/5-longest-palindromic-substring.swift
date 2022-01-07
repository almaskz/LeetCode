class Solution {
    func longestPalindrome(_ s: String) -> String {
        guard s.count > 1 else { return s }
        var n = s.count
        var arr = Array(s)
        var memo = Array(repeating: Array(repeating: false, count: n), count: n)
        var aLeft = 0
        var aRight = 0
        
        for right in 1..<n {
            for left in 0...right {
                if arr[left] == arr[right] && 
                    (right-left < 3 || memo[left+1][right-1]) {
                        memo[left][right] = true
                        if right - left > aRight - aLeft {
                            aLeft = left
                            aRight = right
                        } 
                }
            }
        }
        return String(arr[aLeft...aRight])
    }
}