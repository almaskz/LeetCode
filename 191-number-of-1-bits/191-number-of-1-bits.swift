class Solution {
    func hammingWeight(_ n: Int) -> Int {
        var count = 0
        var a = n
        while a != 0 {
            a = (a&(a-1))<<1
            count += 1
        }
        
        return count
    }
}