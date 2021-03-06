class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        //[2,7,11,15]
        // l    r
        // target = 9
        // sum = 
        var l = 0
        var r = numbers.count-1
        
        while l < r {
            let sum = numbers[l] + numbers[r]
            if sum < target {
                l += 1
            } else if sum > target {
                r -= 1
            } else {
                return [l+1, r+1]
            }
        }
        
        return []
    }
}