class Solution {
    func isValid(_ s: String) -> Bool {
        var stack = [Character]()
        
        for char in s {
            if char == "(" || char == "{" || char == "[" {
                stack.append(char)
            } else if stack.isEmpty {
                return false   
            } else {
                let pop = stack.removeLast()
                if char == ")" && pop != "(" {
                    return false
                } else if char == "}" && pop != "{" {
                    return false
                } else if char == "]" && pop != "[" {
                    return false
                }
            }
        }
        
        return stack.isEmpty 
    }
}