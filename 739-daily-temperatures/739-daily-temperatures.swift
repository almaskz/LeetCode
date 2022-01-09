class Solution {
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        guard temperatures.count > 1 else { return [0] }
        
        //  0  1  2  3 
        //[30,40,50,60]
        //     i
        //[1   0  0  0]
        //[]
        // val = 0
        // diff = 
        
        let n = temperatures.count
        var ans = Array(repeating: 0, count: n)
        var stack = [Int]()
        for i in 0..<n {
            while(stack.isEmpty == false && 
                  temperatures[i] > temperatures[stack[stack.count-1]]) {
                let val = stack.removeLast()
                let diff = i - val
                ans[val] = diff
            }
            stack.append(i)
        }
        
        return ans
    }
}