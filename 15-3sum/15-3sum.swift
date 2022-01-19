class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        guard nums.count > 2 else { return [] }
        var sorted = nums.sorted()
        //[-1,0,1,2,-1,-4]
        //[0,0,0]
        // i l r 
        
        var result = [[Int]]()
        for i in 0..<sorted.count - 2 {
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
                } else if threeSum > 0 {
                    r -= 1
                } else {
                    l += 1
                }
            }
        }
        return result
    }
}