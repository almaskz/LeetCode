class Solution {
    func wiggleSort(_ nums: inout [Int]) {
        for i in 1..<nums.count {
            if (i % 2 == 1 && nums[i-1] > nums[i]) ||
               (i % 2 == 0 && nums[i-1] < nums[i]) {
                nums.swapAt(i, i-1)
            }
        }
    }
}