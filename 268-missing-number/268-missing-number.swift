class Solution {
    func missingNumber(_ nums: [Int]) -> Int {
        // cyclic sort
        
        // 0  1 2
        // [2,1,3]
        //    i
        // if inPlace == -1 => return n
        //    index = 2 return index
        //
        
        let gaussSum = nums.count*(nums.count+1)/2
        let actualSum = nums.reduce(0, +)
        return gaussSum-actualSum
    }
}