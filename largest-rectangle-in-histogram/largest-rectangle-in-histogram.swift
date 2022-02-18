class Solution {
    func largestRectangleArea(_ heights: [Int]) -> Int {
        // 0 1 2 3 4 5
        //[2,1,5,6,2,3]
        // i
        // stack = [-1, 1]
        // max = 0
        
        var maxArea = 0
        // indeces, -1 to indicate the the left end of
        // the current on-going rectangle is the begining of the array, 
        // consider the example (1) when the min height is which is the 2nd element in
        // heights, but the left limit for rectangle is not its index its the bebining of array
        var stack = [-1]    
        
        
        for i in 0..<heights.count {
            while stack.last! != -1 && heights[stack.last!] >= heights[i] {
                let cur = stack.removeLast()                    // 1
                let curArea = heights[cur] * (i-stack.last!-1)  // 2*(2-1)=2 | 
                maxArea = max(curArea, maxArea)                 // 2 
            }
            stack.append(i)
        }
        
        while stack.last! != -1 {
            let cur = stack.removeLast()                     // 1
            // if it is the last index in the stack, 
            // it means this rectangle spans from beginig to the end
            let curArea = heights[cur] * (heights.count-stack.last!-1) 
            maxArea = max(curArea, maxArea)                 
        }
        
        return maxArea
    }  
}