class Solution {
    func calculate(_ s: String) -> Int {
        var result = 0
        var curNum = 0
        var lastNum = 0
    
        var prevOp = "+"
        
        var l = 0
        var arr = Array(s)
        //"3+2*2"
        //     l
        // result = 3
        // curNum = 2
        // lastNum = 2
        // prevOp = "*"
        while l < arr.count {
            if arr[l].isWholeNumber {
                var num = 0
                while l < arr.count, let digit = arr[l].wholeNumberValue {
                    num = num * 10 + digit
                    l += 1
                }
                l -= 1
                curNum = num
            }
            if arr[l].isWholeNumber == false && arr[l] != " " || l == arr.count - 1 {
                if prevOp == "+" {
                    result += lastNum
                    lastNum = curNum
                } else if prevOp == "-" {
                    result += lastNum
                    lastNum = -curNum
                } else if prevOp == "*" {
                    lastNum *= curNum
                } else if prevOp == "/" {
                    lastNum /= curNum
                }
                
                prevOp = String(arr[l])
            }
            l += 1
        }
        
        result += lastNum
        return result
    }
}