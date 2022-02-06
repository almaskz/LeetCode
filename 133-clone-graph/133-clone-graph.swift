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

/*
visited = 


*/
class Solution {
    func cloneGraph(_ node: Node?) -> Node? {
        guard var node = node else { return nil }
        var visited = [Int: Node]()
        return dfs(node, &visited)
    }
    
    // dfs(1) visited = 1 - [2, 4] -> 2
    // dfs(2) visited = 2 - [1, 3] -> 3
    // dfs(3) visited = 3 - [2, 4] -> 4
    // dfs(4) visited = 4 - [3, 1]
    func dfs(_ node: Node, _ visited: inout [Int: Node]) -> Node? {
        let copy = Node(node.val)
        visited[node.val] = copy
        
        for nei in node.neighbors {
            guard let nei = nei else { continue }
            if let copyOfNei = visited[nei.val] {
                copy.neighbors.append(copyOfNei)
            } else {
                let copyOfNei = dfs(nei, &visited)
                copy.neighbors.append(copyOfNei)
            }
        }
        
        return copy
    }
}