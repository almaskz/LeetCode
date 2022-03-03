class Solution {
    func isSubsequence(_ s: String, _ t: String) -> Bool {
        //"abc"
        //    l
        //"ahbgdc"
        //       r
        
        var arr1 = Array(s)
        var arr2 = Array(t)
        var l = 0, r = 0
        while l < arr1.count && r < arr2.count {
            if arr1[l] == arr2[r] {
                l += 1
                r += 1 
            } else {
                r += 1
            }
        }
        
        return l == arr1.count 
    }
}