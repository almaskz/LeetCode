class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        guard needle.isEmpty == false else { return 0 }
        // 012
        // abc
        // c
        //if haystack == needle { return 0 }
        
        var arr = Array(haystack)
        var sub = Array(needle)
        for i in 0..<arr.count {
            if arr[i] == sub[0] && i + sub.count <= arr.count {
                var match = true
                for j in 0..<sub.count {
                    if arr[i+j] != sub[j] {
                        match = false
                    }
                }
                if match {
                    return i
                }
            }
        } 
        return -1
    }
}