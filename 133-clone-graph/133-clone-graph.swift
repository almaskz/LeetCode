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
        return bfs(node)
    }
    
    func bfs(_ node: Node?) -> Node? {
        guard let node = node else { return nil }

    // holds copies
        var visited = [Int: Node]()	// [] 

        // holds original nodes
        var queue = [Node]()		// 

        queue.append(node)		// [1]
        visited[node.val] = Node(node.val)	
    // [1] - [2, 4]
    // [2] - [1]
    // [4] - []
    // [3] - [] 

        // queue = [4]
        while queue.isEmpty == false {
            // for array - O(n), but for queue - O(1)
            let node = queue.removeFirst()	// []

    // 2 -> [1 , 3]
    //  	        i 
            for nei in node.neighbors {
                guard let nei = nei else { continue }
                if let copyOfNei = visited[nei.val] {
                    visited[node.val]?.neighbors.append(copyOfNei)
                } else {
                    let copyOfNei = Node(nei.val)
                    visited[nei.val] = copyOfNei
                    visited[node.val]?.neighbors.append(copyOfNei)
                    queue.append(nei)
                }
    }

        }

        return visited[node.val]
    }

}