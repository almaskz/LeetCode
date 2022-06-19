/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    func getDirections(_ root: TreeNode?, _ startValue: Int, _ destValue: Int) -> String {
        // 1) create an adj list with relationships (LRU)
        // 2) bfs to find the shortest path from startValue to destValue
        guard let root = root else { return "" }
        // adj list
        var adj = [Int: [(rel: String, node: Int)]]()
        var rootToStart = ""
        var rootToDest = ""
        func bfs(_ root: TreeNode) {
            var queue = [(node: root, path: "")]
            
            while queue.isEmpty == false {
                let cur = queue.removeFirst()
                
                if cur.node.val == startValue {
                    rootToStart = cur.path
                }
                if cur.node.val == destValue {
                    rootToDest = cur.path
                }
                
                if let left = cur.node.left {
                    //adj[cur.val, default: []].append((rel: "L", node: left.val))
                    //adj[left.val, default: []].append((rel: "U", node: cur.val))
                    queue.append((node: left, path: cur.path+"L"))
                }
                if let right = cur.node.right {
                    //adj[cur.val, default: []].append((rel: "R", node: right.val))
                    //adj[right.val, default: []].append((rel: "U", node: cur.val))
                    queue.append((node: right, path: cur.path+"R"))
                }
            }
        }
        bfs(root)
        
        // drop common prefix
        var rootToLeft = Array(rootToStart)
        var rootToRight = Array(rootToDest)
        
        var commonPrefix = 0
        
        while commonPrefix < min(rootToLeft.count, rootToRight.count) && 
            rootToLeft[commonPrefix] == rootToRight[commonPrefix] {
                commonPrefix += 1
        }
        
        let left = Array(rootToLeft[commonPrefix...])
        let right = Array(rootToRight[commonPrefix...])
        var ans = ""
        for i in 0..<left.count {
            ans += "U"
        }
    
        return ans + String(right)
    }
}