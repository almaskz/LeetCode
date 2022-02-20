class Solution {
    func missingNumber(_ nums: [Int]) -> Int {
        // cyclic sort
        
        //  0 1 2 3 4 5 6 7 8
        // [1,0,2,3,4,5,6,7,9]
        //                  i
        // if inPlace == -1 => return n
        //    index = 2 return index
        //
        var arr = nums
        var i = 0
        while i < nums.count {
            if arr[i] < nums.count && arr[i] != i {
                arr.swapAt(i, arr[i])    
            } else {
                i += 1
            }
        }
        for i in 0..<arr.count {
            if arr[i] != i {
                return i
            }
        }
        return arr.count
    }
}