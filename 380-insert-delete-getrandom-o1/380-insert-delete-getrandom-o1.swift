
class RandomizedSet {
    private var set = Set<Int>()
    init() {
        
    }
    
    func insert(_ val: Int) -> Bool {
        if set.contains(val) {
            return false
        } else {
            set.insert(val)
            return true
        }
    }
    
    func remove(_ val: Int) -> Bool {
        if set.contains(val) {
            set.remove(val)
            return true
        } else {
            return false
        }
    }
    
    func getRandom() -> Int {
        return set.randomElement()!
    }
}

/**
 * Your RandomizedSet object will be instantiated and called as such:
 * let obj = RandomizedSet()
 * let ret_1: Bool = obj.insert(val)
 * let ret_2: Bool = obj.remove(val)
 * let ret_3: Int = obj.getRandom()
 */