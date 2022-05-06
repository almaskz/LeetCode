class Solution {
    func removeDuplicates(_ s: String, _ k: Int) -> String {
        // 1) stack with [Char: Int]
        // 2) if char int == k pop it
        //
        // deeedbbcccbdaa   k = 3 
        //              i
        // stack = [a: 2] 
        
        
        var stack = [(char: Character,  count : Int)]()
        
        for char in s {
            if stack.isEmpty == false && stack.last!.char == char {
                stack[stack.count-1].count += 1
                
                if stack[stack.count-1].count == k {
                    stack.removeLast()
                }
            } else {
                stack.append((char: char, count : 1))    
            }
        }
        
        var result = ""
        for elem in stack {
            for i in 0..<elem.count {
                result.append(elem.char)
            }
        }
        return result
    }
}