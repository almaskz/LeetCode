
class NumArray {
    //  0  1  2   3  4   5  6
    //[-2, 0, 3, -5, 2, -1 ]
    //  0 -2 -2   1 -4  -2 -3 
    // [0 2] = 1-0 = 1
    // [2 5] = -3+2= -1
    // [0 5 ] = -3-0 = -3
    private var prefix = [0]
 
    init(_ nums: [Int]) {
        var sum = 0
        for num in nums {
            sum += num
            prefix.append(sum)
        }
    }
    
    func sumRange(_ left: Int, _ right: Int) -> Int {
        //[0 2]
        return prefix[right+1] - prefix[left]
    }
}

/**
 * Your NumArray object will be instantiated and called as such:
 * let obj = NumArray(nums)
 * let ret_1: Int = obj.sumRange(left, right)
 */