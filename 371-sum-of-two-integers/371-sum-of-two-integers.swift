class Solution {
    func getSum(_ a: Int, _ b: Int) -> Int {
        // 010 - 2
        // 011 - 3
        // xor 
        // 001 - a
    
        // 010 - 2
        // 011 - 3
        // and
        //0100 - b (a&b << 1)
        
        // 001
        // 100
        // xor
        // 101
        
        // 001
        // 100
        // and
        //0000
        
        var a = a 
        var b = b
        while b != 0 {
            let temp = a
            a ^= b
            b = (b&temp)<<1
        }
        
        return a
    }
}