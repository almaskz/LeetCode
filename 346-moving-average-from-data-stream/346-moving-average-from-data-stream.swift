
class MovingAverage {
    private var size: Int
    private var array = [Int]()
    private var curSum = 0
     
    init(_ size: Int) {
        self.size = size
    }
    
    func next(_ val: Int) -> Double {
        if array.count == size {
            let valToRemove = array[0]
            array.removeFirst()
            curSum -= valToRemove
        }
        array.append(val)
        curSum += val
        return Double(curSum)/Double(array.count)
    }
}

/**
 * Your MovingAverage object will be instantiated and called as such:
 * let obj = MovingAverage(size)
 * let ret_1: Double = obj.next(val)
 */