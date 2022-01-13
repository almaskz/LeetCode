class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        // naive O(n^2)
        // hash O(n)
        // 
        var dict = [Int: Int]()
        for i in 0..<nums.count {
            if let index = dict[target - nums[i]] {
                return [i, index]
            } else {
                dict[nums[i]] = i
            }
        }
        return []
    }
}