class Solution {
    func countBits(_ n: Int) -> [Int] {
        // f[0] = 0 // 0
        // f[1] = 1 // 1
        // f[2] = 1 // 10
        // f[3] = 2 // 11
        // f[4] = 1 // 100
        // f[5] = 2 // 101
        // f[6] =  
        var ans = Array(repeating: 0, count: n+1)
        for i in 0...n {
            ans[i] = getBits(i)
        }
        return ans
    }
    
    func getBits(_ n: Int) -> Int {
        var count = 0
        var num = n
        while num > 0 {
            count += (num % 2)
            num /= 2
        }
        return count
    }
}