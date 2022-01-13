class Solution {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        var set = Set<Int>()
        for i in nums {
            if set.contains(i) {
                return true
            } else {
                set.insert(i)
            }
        }
        return false
    }
}