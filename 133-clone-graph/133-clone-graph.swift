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
        //var dict = [Int: Node]()
        //return dfs(node, &dict)
        return bfs(node)
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
    
    func bfs(_ node: Node?) -> Node? {
        guard let node = node else { return nil }
        
        var visited = [Int: Node]()
        var stack = [Node]()
        
        stack.append(node)
        visited[node.val] = Node(node.val)
        
        while stack.isEmpty == false {
            let curNode = stack.removeFirst()
            
            for nei in curNode.neighbors {
                guard let nei = nei else { continue }
                if let copy = visited[nei.val] {
                    visited[curNode.val]!.neighbors.append(copy) 
                } else {
                    let copy = Node(nei.val)
                    visited[nei.val] = copy
                    visited[curNode.val]!.neighbors.append(copy)
                    stack.append(nei)
                }
            }
        }
        return visited[node.val]
    }
    
}