class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        //[-1,0,1,2,-1,-4] sum = 0
        //[-4 -1 -1 0 1 2]
        //        i l r   
        // sum = -3
        // [-1 -1 2] -> [-1 0 1] ->
        
        guard nums.count > 2 else { return [] }
        let sorted = nums.sorted()
        var result = [[Int]]()
        for i in 0..<sorted.count-2 {
            if i > 0 && sorted[i] == sorted[i-1] {
                continue
            }
            var l = i+1, r = sorted.count-1
            while l < r {
                let threeSum = sorted[i] + sorted[l] + sorted[r]
                if threeSum == 0 {
                    result.append([sorted[i], sorted[l], sorted[r]])
                    l += 1
                    while l < r && sorted[l] == sorted[l-1] {
                        l += 1
                    }
                } else if threeSum < 0 {
                    l += 1                   
                } else {
                    r -= 1
                }
            }
        }
        
        return result
    }
}