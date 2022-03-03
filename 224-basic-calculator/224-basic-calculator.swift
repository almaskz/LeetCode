class Solution {
    func calculate(_ s: String) -> Int {
        var index = 0 
        return helper(&index, Array(s))
    }
    
    // (1+(4+5+2)-3)+(6+8)
    //   i
    // result =  
    // sum = 1
    // sign = 1
    func helper(_ index: inout Int, _ arr: [Character]) -> Int {
        var sum = 0
        var sign = 1
        
        while index < arr.count {
            if arr[index] == "+" {
                sign = 1
            } else if arr[index] == "-" {
                sign = -1
            } else if arr[index].isWholeNumber {
                var num = 0
                while index < arr.count, let digit = arr[index].wholeNumberValue {
                    num = num*10 + digit
                    index += 1
                }
                index -= 1
                sum += (sign*num)
            } else if arr[index] == "(" {
                index += 1      // pass ( and recurse on the rest of array
                let result = helper(&index, arr)
                sum += (sign*result)
            } else if arr[index] == ")" {
                return sum
            }
            index += 1
        }
        
        return sum
    }
    
}