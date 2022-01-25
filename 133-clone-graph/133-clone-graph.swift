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
        return dfs(node, &dict)
    }
    
    func dfs(_ node: Node?, _ dict: inout [Int: Node]) -> Node? {
        guard let node = node else { return nil }
        if let copy = dict[node.val] {
            return copy
        } else {
            let copy = Node(node.val)
            dict[node.val] = copy
            for nei in node.neighbors {
                copy.neighbors.append(dfs(nei, &dict))
            }
            return copy
        }
    }
    
}