class Solution {
    func calculate(_ s: String) -> Int {
        var lastNum = 0 
        var curNum = 0
        var result = 0
        var sign = "+"
        var l = 0
        var arr = Array(s)
        //"3+2*2"
        //     l
        // cur = 0
        // [3 2]
        // op = "*"
        
        while l < arr.count {
            if arr[l].isWholeNumber {
                var num = 0
                while l < arr.count, let digit = arr[l].wholeNumberValue {
                    num = num*10 + digit
                    l += 1
                }
                l -= 1
                curNum = num
            } 
            if  arr[l] == "*" || arr[l] == "/" ||
                arr[l] == "+" || arr[l] == "-"  || 
                l == arr.count - 1 {
                if sign == "*" {
                    lastNum *= curNum
                } else if sign == "/" {
                    lastNum /= curNum
                } else if sign == "+" {
                    result += lastNum
                    lastNum = curNum
                } else if sign == "-" {
                    result += lastNum
                    lastNum = -(curNum)
                }
                sign = String(arr[l])
                curNum = 0
            }
            l += 1
        }
        result += lastNum
        return result
    }
}