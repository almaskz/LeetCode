
class WordDictionary {
    class TrieNode <T: Hashable> {
        var val: T?
        var adj = [T: TrieNode]()
        var isEnd = false
        
        init(_ val: T? = nil) {
            self.val = val
        }
        
        func add(_ val: T) -> TrieNode? {
            if adj[val] != nil {
                return  nil
            }
            let node = TrieNode(val)
            adj[val] = node
            return node
        }
    }
    
    typealias Node = TrieNode<Character>
    var root: Node
    
    init() {
        self.root = Node()
    }
    
    func addWord(_ word: String) {
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
        return dfs(Array(word), 0, root)
    }
    
    private func dfs(_ arr: [Character], _ index: Int, _ cur: Node) -> Bool {
        if index == arr.count {
            return cur.isEnd
        }
        if arr[index] == "." {
            // iterate all 
            for val in cur.adj.values {
                if dfs(arr, index+1, val) {
                    return true
                }
            }
            return false
        } else if let node = cur.adj[arr[index]] {
            return dfs(arr, index+1, node)
        } else {
            return false   
        }
    }
}

/**
 * Your WordDictionary object will be instantiated and called as such:
 * let obj = WordDictionary()
 * obj.addWord(word)
 * let ret_2: Bool = obj.search(word)
 */