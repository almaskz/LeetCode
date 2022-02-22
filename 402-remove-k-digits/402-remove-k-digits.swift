class Solution {
    func removeKdigits(_ num: String, _ k: Int) -> String {
        if k == num.count { return "0" }
        
        // 1432219   k = 3
        //   i
        // stack = [1]
        // count = 1
        
        var stack = [Int]()
        var count = 0
        
        for i in num {
            while count < k && !stack.isEmpty && stack.last! > i.wholeNumberValue! {
                stack.removeLast()
                count += 1 
            }
            stack.append(i.wholeNumberValue!)
        }
        
        // remove big digits from the end of monotonic stack
        while count < k && !stack.isEmpty {
            stack.removeLast()
            count += 1
        }
        
        
        // contract an answer, consider leading zeros
        var ans = ""
        var leadingZero = true
        for i in stack {
            if i != 0 {
                leadingZero = false
            }
            if leadingZero == false {
                ans += "\(i)"
            } 
        }
        return ans.isEmpty ? "0" : ans
    }
}