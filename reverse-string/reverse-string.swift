class Solution {
    func reverseString(_ s: inout [Character]) {
        func recursive(_ l: Int, _ r: Int) {
            if l >= r { return }
            
            s.swapAt(l, r)
            recursive(l+1, r-1)
        }
        recursive(0, s.count-1)
    }
}