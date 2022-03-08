class Solution {
    func characterReplacement(_ s: String, _ k: Int) -> Int {
        // 0123456
        //"AABABBA", k = 1
        //     l
        //      r
        // count = 0
        // maxL = 4
        
        var arr = Array(s)
        var maxL = 0
        var dict = [Character: Int]()   // dict of the character frequences of the current window
        
        var l = 0
        var maxF = 0
        for r in 0..<arr.count {
            dict[arr[r], default: 0] += 1
            maxF = max(maxF, dict[arr[r]]!)
            while ((r-l+1) - maxF) > k {
                dict[arr[l], default: 0] -= 1
                l += 1
            }
            maxL = max(maxL, r-l+1)
        }
        return maxL
    }
}