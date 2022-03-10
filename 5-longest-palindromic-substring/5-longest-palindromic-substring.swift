class Solution {
    func longestPalindrome(_ s: String) -> String {
        var arr = Array(s)
        var maxSide = (left: 0, right: 0)
        for i in 0..<arr.count {
            let evenPalindrom = longestPalindrom(i, i, arr)
            let oddPalindrom = longestPalindrom(i, i+1, arr) 
            if evenPalindrom.right - evenPalindrom.left > maxSide.right - maxSide.left {
                maxSide = evenPalindrom
            }
            if oddPalindrom.right - oddPalindrom.left > maxSide.right - maxSide.left {
                maxSide = oddPalindrom
            }
        }
        
        return String(arr[maxSide.left...maxSide.right])
    }
    
    func longestPalindrom(_ left: Int, _ right: Int,  _ arr: [Character]) -> (left: Int, right: Int) {
        var l = left, r = right
        
        // 1 - case i is center
        // 2 - case arr[l] == arr[r]  
        while l >= 0 && r < arr.count && arr[l] == arr[r] {
            l -= 1
            r += 1
        }
        return (left: l+1, right: r-1)
    }
}