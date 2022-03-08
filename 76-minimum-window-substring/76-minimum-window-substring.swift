class Solution {
    func minWindow(_ s: String, _ t: String) -> String {
        //"ADOBECODEBANC", "ABC"
        // l
        // r
        // window = [A: 1]
        
        guard t.count <= s.count else { return "" }
        
        // set all "t" characters into the hashmap
        var countT = [Character: Int]()
        for char in t {
            countT[char,default: 0] += 1
        }
        var window = [Character: Int]()
        
        var have = 0
        var need = countT.keys.count
        
        var result = [-1, -1] // default values
        
        var l = 0
        var arr = Array(s)
        for r in 0..<arr.count {
            let cur = arr[r]
            if let freq = countT[cur] {
                window[cur, default: 0] += 1
                
                if window[cur]! == freq {
                    have += 1 
                }
            }
            
            while have == need {
                // udpate result
                if result[0] == -1 || r-l < result[1]-result[0] {
                    result[0] = l
                    result[1] = r
                }
                // pop left
                let leftCur = arr[l]
                if let freq = countT[leftCur] {
                    window[leftCur, default: 0] -= 1
                    if window[leftCur]! < freq {
                        have -= 1
                    }
                }
                l += 1
            }
        }
        if result[1] != -1 && result[1] - result[0] >= 0 {
            return String(arr[result[0]...result[1]])
        } else {
            return ""
        }
    }
}