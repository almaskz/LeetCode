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
        // will hold copies of the nodes 
        var visited = [Int: Node]() 
        return dfs(node, &visited)
    }
    
    func dfs(_ node: Node?, _ visited: inout [Int: Node]) -> Node?{
        guard let node = node else { return nil }
        let copy = Node(node.val)
        visited[node.val] = copy
        for nei in node.neighbors {
            guard let nei = nei else { continue }
            if let neiCopy = visited[nei.val] {
                visited[node.val]?.neighbors.append(neiCopy)
            } else {
                let neiCopy = dfs(nei, &visited)
                visited[node.val]?.neighbors.append(neiCopy)
            }
        }
        
        return visited[node.val]
    }
}