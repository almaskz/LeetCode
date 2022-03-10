class Solution {
    func countSubstrings(_ s: String) -> Int {
        var arr = Array(s)
        
        var count = 0
        for i in 0..<arr.count {
            count += numberOfPolindroms(i, i, arr)
            count += numberOfPolindroms(i, i+1, arr)
        }
        return count
    }
    
    func numberOfPolindroms(_ left: Int, _ right: Int, _ arr: [Character]) -> Int {
        var count = 0
        var l = left
        var r = right
        
        while l >= 0 && r < arr.count && arr[l] == arr[r] {
            count += 1
            l -= 1
            r += 1
        }
        return count
    }
}