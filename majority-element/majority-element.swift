class Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        var index = Int.random(in: 0..<nums.count)
        while(checkMajority(nums, nums[index]) == false) {
            index = Int.random(in: 0..<nums.count)
        }
        
        return nums[index]
    }
    
    func checkMajority(_ nums: [Int], _ num: Int) -> Bool {
        var count = 0
        for i in nums {
            if num == i {
                count += 1
            }
        }
        
        return count > nums.count/2
    }
}