class Node {
    var key: Int
    var val: Int
    var next: Node? = nil
    var prev: Node? = nil
    
    init(_ key: Int, _ val: Int) {
        self.key = key
        self.val = val
    }
}

class LRUCache {
    var size: Int
    var cache: [Int: Node]
    var left: Node
    var right: Node

    init(_ capacity: Int) {
        size = capacity
        cache = [Int: Node]()
        // left = LRU and right = most recently used
        left = Node(0, 0)
        right = Node(0, 0)
        
        left.next = right
        right.prev = left
    }
    
    func remove(_ node: Node) {
        let prev = node.prev
        let next = node.next
        prev?.next = next
        next?.prev = prev
    }
    
    func insert(_ node: Node) {
        let prev = right.prev
        let next = right
        next.prev = node
        prev?.next = node
        node.prev = prev
        node.next = next
    }
    
    func get(_ key: Int) -> Int {
        if let node = cache[key] {
            // update to be the most recently used
            remove(node)
            insert(node)
            return node.val
        }
        return -1
    }
    
    func put(_ key: Int, _ value: Int) {
        if let node = cache[key] {
            remove(node)
        }
        let node = Node(key, value)
        cache[key] = node
        insert(node)
        
        if cache.count > size {
            if let lru = left.next {
                remove(lru)
                cache.removeValue(forKey: lru.key)    
            }
        }
    }
}

/**
 * Your LRUCache object will be instantiated and called as such:
 * let obj = LRUCache(capacity)
 * let ret_1: Int = obj.get(key)
 * obj.put(key, value)
 */