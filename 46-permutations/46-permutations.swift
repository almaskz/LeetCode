class Solution {    
    func permute(_ nums: [Int]) -> [[Int]] {
        var ans = [[Int]]()
        // 123
        // [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
        //       1              
        //      123      
        //    23 13 12
        //   3 2 3 1 2 1 
        var temp = nums
        backtrack(&temp, &ans, 0)
        return ans
    }
    
    func backtrack(_ nums: inout [Int], _ ans: inout [[Int]], _ first: Int) {
        if first == nums.count {
            ans.append(nums)
            return
        }
        
        for i in first..<nums.count {
            nums.swapAt(first, i)
            backtrack(&nums, &ans, first+1)
            nums.swapAt(first, i)
        }
    }
}