class Solution {
    func validPalindrome(_ s: String) -> Bool {
        guard s.count > 2 else { return true } 
        var hasSkip = true
        var l = 0
        var r = s.count-1
        var arr = Array(s)
        
        return recursive(0, arr.count-1, arr, &hasSkip)
    }
    
    func recursive(_ left: Int, _ right: Int, _ arr: [Character], _ hasSkip: inout Bool) -> Bool {
        if left >= right {
            return true
        }
        if arr[left] == arr[right] {
            return recursive(left+1, right-1, arr, &hasSkip)
        } else if hasSkip {
            hasSkip = false
            return recursive(left+1, right, arr, &hasSkip) || 
                    recursive(left, right-1, arr, &hasSkip)
        } else {
            return false
        }
    }
}