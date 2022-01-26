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
        dfs(node, &visited)
        if let node = node {
            return visited[node.val]
        } else {
            return nil
        }
        //return bfs(node)
    }
    
    func dfs(_ node: Node?, _ visited: inout [Int: Node]) {
        
        guard let node = node else { return }
            
        let copy = Node(node.val)
        visited[node.val] = copy
        for nei in node.neighbors {
            guard let nei = nei else { continue }
            if let neiCopy = visited[nei.val] {
                visited[node.val]?.neighbors.append(neiCopy)
            } else {
                dfs(nei, &visited)
                visited[node.val]?.neighbors.append(visited[nei.val])
            }
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