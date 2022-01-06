class Trie {
    class TrieNode<T: Hashable> {
        var value: T?
        var children = [T: TrieNode]()
        var isEnd = false
        
        init(value: T? = nil) {
            self.value = value
        }
        
        func add(_ child: T) {
            guard children[child] == nil else { return }
            children[child] = TrieNode(value: child)
        }
    }
    
    typealias Node = TrieNode<Character>
    var root: Node

    init() {
        root = Node()
    }
    
    func insert(_ word: String) {
        guard word.isEmpty == false else { return }
        
        var currentNode = root

        for char in word {
            if let child = currentNode.children[char] {
                currentNode = child
            } else {
                currentNode.add(char)
                currentNode = currentNode.children[char]!
            }
        }
        
        currentNode.isEnd = true
    }
    
    
    func search(_ word: String) -> Bool {
        guard word.isEmpty == false else { return false }
        
        var currentNode = root
        var currentIndex = 0
        var arr = Array(word)
        
        while currentIndex < arr.count {
            if let child = currentNode.children[arr[currentIndex]] {
                currentNode = child
            } else {
                return false
            }
            currentIndex += 1
        }
        
        return currentNode.isEnd
    }
    
    func startsWith(_ prefix: String) -> Bool {
        guard prefix.isEmpty == false else { return false }
        
        var currentNode = root
        var currentIndex = 0
        var arr = Array(prefix)
        
        while currentIndex < arr.count {
            if let child = currentNode.children[arr[currentIndex]] {
                currentNode = child
            } else {
                return false
            }
            currentIndex += 1
        }
        
        return true
    }
}
/**
 * Your Trie object will be instantiated and called as such:
 * let obj = Trie()
 * obj.insert(word)
 * let ret_2: Bool = obj.search(word)
 * let ret_3: Bool = obj.startsWith(prefix)
 */