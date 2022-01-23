class Solution {
    func hammingWeight(_ n: Int) -> Int {
        var count = 0
        var a = n
        while a != 0 {
            let remainder = a%2
            if remainder == 1 {
                count += 1
            }
            a = a >> 1
        }
        
        return count
    }
}