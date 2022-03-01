class Solution {
    func calculate(_ s: String) -> Int {
        var stack = [Int]()
        var currentNumber = 0
        var operation = "+"
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
                currentNumber = num
            } 
            if arr[l] == "*" || arr[l] == "/" || arr[l] == "+" || arr[l] == "-"  || l == arr.count - 1 {
                if operation == "*" {
                    let lastNum = stack.removeLast()
                    stack.append(lastNum*currentNumber)
                } else if operation == "/" {
                     let lastNum = stack.removeLast()
                    stack.append(lastNum/currentNumber)
                } else if operation == "+" {
                    stack.append(currentNumber)
                } else if operation == "-" {
                    stack.append((-1)*currentNumber)
                }
                operation = String(arr[l])
                currentNumber = 0
            }
            l += 1
        }
        currentNumber = 0
        while stack.isEmpty == false {
            currentNumber += stack.removeLast()
        }
        return currentNumber
    }
}