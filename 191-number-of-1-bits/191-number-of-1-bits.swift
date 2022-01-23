class Solution {
    func hammingWeight(_ n: Int) -> Int {
        var count = 0
        var a = n
        while a != 0 {
            count += a%2
            a = a >> 1
        }
        
        return count
    }
}