class Solution {
    func evalRPN(_ tokens: [String]) -> Int {
        var stack = [Int]()
        
        for item in tokens {
            if let num = Int(item) {
                stack.append(num)
            } else {
                let num1 = stack.removeLast()
                let num2 = stack.removeLast()
                if item == "+" {
                    stack.append(num1+num2)
                } else if item == "-" {
                    stack.append(num2-num1)
                } else if item == "*" {
                    stack.append(num1*num2)
                } else if item == "/" {
                    stack.append(num2/num1)
                }
            }
        }
        return stack[0]
    }
}