class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {        
        //[-1,0,1,2,-1,-4]
        //[-4, -1, -1, 0, 1, 2]
        //  i    
        //      l            
        //                   r 
        guard nums.count > 2 else { return [] }
        var sorted = nums.sorted()
        var result = [[Int]]()

        for i in 0..<sorted.count-2 {
            if i > 0 && sorted[i] == sorted[i-1] {
                continue
            }
            var l = i + 1
            var r = sorted.count-1
            while l < r {
                let sum = sorted[i] + sorted[l] + sorted[r]
                if sum > 0 {
                    r -= 1
                } else if sum < 0 {
                    l += 1
                } else {
                    result.append([sorted[i], sorted[l], sorted[r]])
                    l += 1 
                    while l < r && sorted[l] == sorted[l-1] {
                        l += 1
                    }
                }       
            }
        }
        return result
    }
}