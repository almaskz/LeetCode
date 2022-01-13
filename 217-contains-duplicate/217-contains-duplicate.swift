class Solution {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        var dict = [Int: Bool]()
        for i in nums {
            if let elem = dict[i] {
                return elem
            } else {
                dict[i] = true
            }
        }
        return false
    }
}