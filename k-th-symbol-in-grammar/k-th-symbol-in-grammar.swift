class Solution {
    func kthGrammar(_ n: Int, _ k: Int) -> Int {
        /*
              12345678
        row 1   0
        row 2  0 1
        row 3 01 10
        row 4 01101001
        row 5 0110100110010110
        */
        //n = 1, k = 1
        if n == 1 {
            return 0
        }
        
        let newK: Int = k/2 + k%2 
    
        let parent = kthGrammar(n-1, newK)
        
        if parent == 0 {
            if k % 2 == 0 {
                return 1
            } else {
                return 0
            }
        } else {
            if k % 2 == 0 {
                return 0
            } else {
                return 1
            }
        }
    }
}