class Solution {
    func isPowerOfTwo(_ n: Int) -> Bool {
        if n == 0 { return false }
        if n == 1 { return true }
        return (n & (n-1)) == 0 
        // if n % 2 == 0 {
        //     return isPowerOfTwo(n/2)
        // }
        // return false
        
//         var num = n
        
//         while num % 2 == 0 {
//             num /= 2
//             if num == 1 {
//                 return true
//             }
//         }
//         return false
        
        // 3
        // 011 = 3 
        // 010 = 2
        // 010 = 2
        
        // 8 
        // 1000 = 8
        // 0111 = 7
        // 0000 = 0
        //(n & (n - 1)) == 0
    }
}