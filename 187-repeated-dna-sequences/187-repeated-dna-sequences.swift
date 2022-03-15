class Solution {
    func findRepeatedDnaSequences(_ s: String) -> [String] {
        //"AAAAACCCCCAAAAACCCCCCAAAAAGGGTTT"
        //                      l         r
        guard s.count >= 10 else { return [] }
        var arr = Array(s)
        var dnaSet = Set<String>()
        var l = 0
        var result = Set<String>()
        for r in 9..<arr.count {
            var curDNA = String(arr[l...r])
            if dnaSet.contains(curDNA) {
                result.insert(curDNA)
            } else {
                dnaSet.insert(curDNA)
            }
            l += 1
        }
        return Array(result)
    }
}