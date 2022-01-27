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
        var visitedCopies = [Int: Node]()
	    return dfs(node, &visitedCopies)
    }
    
    func dfs(_ node: Node?, _ visited: inout [Int: Node]) -> Node? {
        guard let node = node else { return nil }

        visited[node.val] = Node(node.val)

        for nei in node.neighbors {
            guard let nei = nei else { continue }
            if let copyOfNei = visited[nei.val] {
                visited[node.val]?.neighbors.append(copyOfNei)
            } else {
                let copyOfNei = dfs(nei, &visited)
                visited[node.val]?.neighbors.append(copyOfNei)
            }
        }
        return visited[node.val]
    }
}