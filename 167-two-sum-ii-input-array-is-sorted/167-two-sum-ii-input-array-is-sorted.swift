class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        //[2,7,11,15]      target = 9
        // l r          
        // l+r = 9
        //
        
        var l = 0, r = numbers.count-1
        while l < r {
            let cur = numbers[l] + numbers[r]
            if cur == target {
                return [l+1, r+1]
            } else if cur > target {
                r -= 1
            } else {
                l += 1 
            }
        }
        return []
    }
}