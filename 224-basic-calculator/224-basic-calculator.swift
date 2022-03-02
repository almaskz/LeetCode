class Solution {
    func calculate(_ s: String) -> Int {
        var index = 0 
        return helper(&index, Array(s))
    }
    
    func helper(_ index: inout Int, _ arr: [Character]) -> Int {
        var sign = 1
        var result = 0
        var current = 0
        
        //"1 + 1"
        // i
        
        while index < arr.count {
            if arr[index].isWholeNumber {
                var num = 0
                while index < arr.count, let digit = arr[index].wholeNumberValue {
                    num = num * 10 + digit
                    index += 1
                }
                current = num
                result += (current*sign)
                current = 0
                sign = 1
            } else if arr[index] == "(" {
                index += 1
                current = helper(&index, arr)
                result += (current*sign)
                current = 0
                sign = 1
                index += 1
            } else if arr[index] == ")" {
                return result + (sign * current)
            } else if arr[index] == "+" {
                sign = 1
                index += 1
            } else if arr[index] == "-" {
                sign = -1
                index += 1
            } else {
                index += 1    
            }
        }
        return result
    }
    
}