class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        //nums = [2,7,11,15], target = 9
        // 9-7 = 2 
        // [2,7,11,15]
        //    i 
        // [2] = 0
        // []
        
        var dict = [Int: Int]()
        for i in 0..<nums.count {
            let diff = target - nums[i]
            if let index = dict[diff] {
                return [i, index]
            } else {
                dict[nums[i]] = i
            }
        }
        
        return [0,0]
    }
}