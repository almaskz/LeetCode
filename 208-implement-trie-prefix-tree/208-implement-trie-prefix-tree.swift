
class Trie {
    class TrieNode <T: Hashable> {
        var val: T?
        var adj = [T: TrieNode]()
        var isEnd = false
        
        init(_ val: T? = nil) {
            self.val = val
        }
        
        func add(_ child: T) -> TrieNode? {
            guard adj[child] == nil else { return nil }
            let node = TrieNode(child)
            adj[child] = node
            return node
        }
    }
    
    typealias Node = TrieNode<Character>
    var root: Node
    
    init() {
        root = Node()
    }
    
    func insert(_ word: String) {
        guard word.isEmpty == false else { return }
        var cur = root
        for char in word {
            if let node = cur.adj[char] {
                cur = node
            } else if let node = cur.add(char) {
                cur = node
            }
        }
        cur.isEnd = true
    }
    
    func search(_ word: String) -> Bool {
        var cur = root
        for char in word {
            if let node = cur.adj[char] {
                cur = node
            } else {
                return false
            }
        }
        return cur.isEnd 
    }
    
    func startsWith(_ prefix: String) -> Bool {
        var cur = root
        for char in prefix {
            if let node = cur.adj[char] {
                cur = node
            } else {
                return false
            }
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