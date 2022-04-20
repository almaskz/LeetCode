class Solution {
    func calPoints(_ ops: [String]) -> Int {
        // ops = ["5","2","C","D","+"]
        // stack = [5 10 15] = 30
        //
        // ops = ["5","-2","4","C","D","9","+","+"]
        // stack = [5 -2 -4 9 5 14] =  27
        //
        // TC: O(n)
        // SC: O(n) x-> O(1) (keep the last 3 values)
        // 
        
        var stack = [Int]()

        for op in ops {
            if op == "C" {
                stack.removeLast()
            } else if op == "D" {
                let value = stack[stack.count-1]
                stack.append(value*2)
            } else if op == "+" {
                let last = stack[stack.count-1]
                let prev = stack[stack.count-2]
                stack.append(last+prev)
            } else {
                guard let newValue = Int(op) else { continue }
                stack.append(newValue)
            }
        }
        
        return stack.reduce(0, +)
    }
}