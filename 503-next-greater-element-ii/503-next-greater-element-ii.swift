class Solution {
    func nextGreaterElements(_ nums: [Int]) -> [Int] {
        guard nums.count > 1 else { return [-1] }
        let n = nums.count
        var stack = [Int]() // decreasing stack 
        var ans = Array(repeating: -1, count: n)
        //.      0 1 2 3 4 5
        // nums [1 2 4 8 3 1]
        //           i
        // stack = [3 4 5]
        // ans = [2 4 8 -1 -1]
        for i in 0..<n*2 {
            let index = i % n
            while (stack.isEmpty == false && nums[index] > nums[stack[stack.count-1]]) {
                let val = stack.removeLast()
                ans[val] = nums[index]
            }
            stack.append(index)
        }
        
        return ans
    }
}