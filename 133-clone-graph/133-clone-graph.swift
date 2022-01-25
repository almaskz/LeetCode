/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var neighbors: [Node?]
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.neighbors = []
 *     }
 * }
 */

class Solution {
    func cloneGraph(_ node: Node?) -> Node? {
        var dict = [Int: Node]()
        
        func dfs(_ node: Node?) -> Node? {
            guard let node = node else { return nil }
            if let copy = dict[node.val] {
                return copy
            } else {
                let copy = Node(node.val)
                dict[node.val] = copy
                for nei in node.neighbors {
                    copy.neighbors.append(dfs(nei))
                }
                return copy
            }
        }
        
        return dfs(node)
    }
}