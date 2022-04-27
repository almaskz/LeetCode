class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        //  0 1  2 3 
        // [2,7,11,15]
        //  i 
        // target = 9
        // 
        // map = [(),]
        var map = [Int: Int]() // number and it's index
        for i in 0..<nums.count {
            let val = target - nums[i]
            if let index = map[val] {
                return [i, index]
            } else {
                map[nums[i]] = i 
            }
        }
        return []
    }
}