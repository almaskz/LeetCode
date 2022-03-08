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

        for r in 0..<arr.count {
            dict[arr[r], default: 0] += 1
            
            while ((r-l+1) - maxF(dict)) > k {
                dict[arr[l], default: 0] -= 1
                l += 1
            }
            maxL = max(maxL, r-l+1)
        }
        return maxL
    }
        
    private func maxF(_ dict: [Character: Int]) -> Int {
        var maxF = 0
        for value in dict.values {
            maxF = max(maxF, value)
        }
        return maxF
    }
}