class Solution {
    func reverseString(_ s: inout [Character]) {
        recursive(0, s.count-1, &s)
    }
    
    func recursive(_ left: Int, _ right: Int, _ s: inout [Character]) {
        if left >= right {
            return    
        }
        let temp = s[left]
        s[left] = s[right]
        s[right] = temp
        recursive(left+1, right-1, &s)
    }
}