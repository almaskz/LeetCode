
class RandomizedSet {
    private var dict = [Int: Int]()         // num : index
    private var arr = [Int]()
    init() {
        
    }
    
    func insert(_ val: Int) -> Bool {
        if let index = dict[val] {
            return false
        } else {
            arr.append(val)
            dict[val] = arr.count-1
            return true
        }
    }
    
    func remove(_ val: Int) -> Bool {
        if let index = dict[val] {
            let elemToSwap = arr[arr.count-1]
            arr.swapAt(index, arr.count-1)
            arr.removeLast()
            dict[elemToSwap] = index
            dict.removeValue(forKey: val)
            return true
        } else {
            return false
        }
    }
    
    func getRandom() -> Int {
        return arr.randomElement()!
    }
}

/**
 * Your RandomizedSet object will be instantiated and called as such:
 * let obj = RandomizedSet()
 * let ret_1: Bool = obj.insert(val)
 * let ret_2: Bool = obj.remove(val)
 * let ret_3: Int = obj.getRandom()
 */