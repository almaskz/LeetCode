class Solution {
    func isPalindrome(_ s: String) -> Bool {
        var arr = [Character]()
    
        for char in s {
            if char.isLetter || char.isWholeNumber {
                arr.append(Character(char.lowercased()))
            }
        }
        guard arr.count > 0 else { return true }
        var n = arr.count-1
        for i in 0...n/2 {
            if arr[i] != arr[n-i] {
                return false
            }
        }
        return true
    }
}