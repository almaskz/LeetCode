class Solution {
    func shortestPalindrome(_ s: String) -> String {
        var arr = Array(s)
        
        guard arr.count > 0 else { return "" }
        
        // find the center of the prefix palindrom
        var center: Int = arr.count/2 + 1
        var strToAdd = ""
        while center > 0 {
             // case 1: odd palindrome, i.e. "aba"
            let case1 = expendCenter(arr, center - 1, center + 1)
            
             // case 2: even palindrome. i.e. "aa"
            let case2 = expendCenter(arr, center - 1, center)
            
            if case1 {
                return stringToAdd(arr, center) + s
            } else if case2 {
                return stringToAdd2(arr, center) + s
            } else {
                center -= 1
            }
        }
        
        return stringToAdd(arr, 0) + s
        
        
        // 0123456789
        // aaccaaabb
    }
    
    func stringToAdd(_ arr: [Character], _ center: Int) -> String {
        guard center*2 + 1 < arr.count else { return "" }
        return String(arr[center*2+1..<arr.count].reversed())
    } 
    
    func stringToAdd2(_ arr: [Character], _ center: Int) -> String {
        guard center*2 < arr.count else { return "" }
        return String(arr[center*2..<arr.count].reversed())
    }
    
    func expendCenter(_ arr: [Character], _ left: Int, _ right: Int) -> Bool {
        var l = left
        var r = right
        while l >= 0 && r < arr.count && arr[l] == arr[r] {
            if l == 0 { 
                return true
            }
            l -= 1
            r += 1
        }
        return false
    }
}