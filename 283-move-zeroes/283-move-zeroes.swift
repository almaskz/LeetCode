class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        var l = 0
        var r = l
        
        //[1,0]
        //   l
        // r 
        
        while l < nums.count {
            if nums[l] == 0 {
                if r < l {
                    r = l
                }
                while r < nums.count && nums[r] == 0 {
                    r += 1
                }
                if r < nums.count {
                    nums.swapAt(r, l)
                } else {
                    break
                }            
            }
            l += 1
        }
        
    }
}