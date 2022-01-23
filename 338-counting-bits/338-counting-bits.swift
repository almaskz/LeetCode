class Solution {
    func countBits(_ n: Int) -> [Int] {
        /*
        0 --> 00000 = 0 
        1 --> 00001 = 1 => offset = 1 
        2 --> 00010 = 1 => offset = 2
        3 --> 00011 = 2 => 
        4 --> 00100 = 1 => offset = 4 
        5 --> 00101 = 2 => offset = 4
        6 --> 00110 = 2 => offset = 4 
        7 --> 00111 = 3 => offset = 4 
        8 --> 01000 = 1 => offset = 8
        9 --> 01001 = 2 
        10 -> 01010 = 2
        11 -> 01011 = 3
        12 -> 01100 = 2
        13 -> 01101 = 3
        14 -> 01110 = 3
        15 -> 01111 = 4
        16 -> 10000 = 1
        17 -> 10001 = 2
        18 -> 10010 = 2
        19 -> 10011 = 3
        20 -> 10100 = 2
        */
        guard n > 0 else { return [0] }
        var dp = Array(repeating: 0, count: n+1)
        
        var offset = 1
        for i in 1...n {
            if offset * 2 == i {
                offset = i
            }
            dp[i] = 1 + dp[i-offset]
        }
        
        return dp
    }
}