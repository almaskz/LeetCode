
class NumArray {
    //[1, 3, 5]
    var arr: [Int]
    init(_ nums: [Int]) {
        arr = nums
    }
    
    func update(_ index: Int, _ val: Int) {
        arr[index] = val
    }
    
    func sumRange(_ left: Int, _ right: Int) -> Int {
        var sum = 0
        for i in left...right {
            sum += arr[i]
        }
        return sum
    }
}

/**
 * Your NumArray object will be instantiated and called as such:
 * let obj = NumArray(nums)
 * obj.update(index, val)
 * let ret_2: Int = obj.sumRange(left, right)
 */