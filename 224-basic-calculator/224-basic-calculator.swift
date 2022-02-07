class Solution {
    /*
   "1 + 1"
        l
    
    num = 1
    
    sum = 1
    sign = 1
    stack = []
    */
    func calculate(_ s: String) -> Int {
        var sign = 1 // can be -1
        var sum = 0
        var stack = [Int]()
        
        var arr = Array(s)
        var l = 0
        while l < arr.count {
            // number
            if arr[l].isNumber {                        // number 
                var num = 0
                while l < arr.count && arr[l].isNumber {
                    num = num*10 + arr[l].wholeNumberValue!
                    l += 1
                }
                sum += (num*sign)
            } else if arr[l] == Character("+") {        // sign + 
                sign = 1
                l += 1
            } else if arr[l] == Character("-") {        // sign - 
                sign = -1
                l += 1
            } else if arr[l] == Character("(") {
                stack.append(sum)
                stack.append(sign)
                sum = 0
                sign = 1
                l += 1
            } else if arr[l] == Character(")") {
                sum = stack.removeLast() * sum
                sum += stack.removeLast()
                l += 1
            } else {
                l += 1
            }
        }
        
        return sum
    }
}