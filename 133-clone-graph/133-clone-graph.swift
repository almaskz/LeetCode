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
        
        var visited = [Int: Node]()     // holds copies of nodes
        var stack = [Node]()            // holds original nodes
        
        stack.append(node)              
        visited[node.val] = Node(node.val)
        
        while stack.isEmpty == false {
            let curNode = stack.removeFirst()
            
            for nei in curNode.neighbors {
                guard let nei = nei else { continue }
                
                // we already created copy for this node
                if let copy = visited[nei.val] {
                    // just append that copy to the neighbors of curNode
                    visited[curNode.val]!.neighbors.append(copy) 
                } else {
                    // we need to create a fresh copy
                    let copy = Node(nei.val)
                    // assign that copy to as visited
                    visited[nei.val] = copy
                    // append that copy to neighbors of curNode
                    visited[curNode.val]!.neighbors.append(copy)
                    // add nei to the stack to seach its neighbors
                    stack.append(nei)
                }
            }
        }
        return visited[node.val]
    }
    
}