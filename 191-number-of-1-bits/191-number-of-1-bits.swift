class Solution {
    func hammingWeight(_ n: Int) -> Int {
        // 0100
        // 0001
        // 0001
        var count = 0
        var a = n
        while a != 0 {
            count += a&1
            a = a >> 1
        }
        
        return count
    }
}