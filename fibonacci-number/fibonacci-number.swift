class Solution {
    func fib(_ n: Int) -> Int {
        var f0 = 0
        var f1 = 1 
        if n == 0 { return f0 }
        if n == 1 { return f1 }
        
        // 3 | 
        for i in 2...n {
            let temp = f1   // temp = 1
            f1 += f0        // f1 = 2
            f0 = temp       // f0 = 1
        }
        return f1
    }
}