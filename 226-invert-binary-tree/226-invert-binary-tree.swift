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
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        return bfs(root)
    }
    
    func bfs(_ root: TreeNode?) -> TreeNode? {
        guard let node = root else { return nil }
        
        var queue = [node]
        
        while queue.isEmpty == false {
            let cur = queue.removeFirst()
            
            let left = cur.left
            let right = cur.right
            cur.left = right
            cur.right = left
            
            if let left = cur.left {
                queue.append(left)
            }
            if let right = cur.right {
                queue.append(right)
            }
        }
        return node
    }
}