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
    func isCousins(_ root: TreeNode?, _ x: Int, _ y: Int) -> Bool {
        
        var xParent = -1
        var yParent = -1
        var xDepth = -1
        var yDepth = -1
        func dfs(_ node: TreeNode?,
                 _ parent: Int,
                 _ depth: Int) {
            guard let node = node else { return }
            
            if node.val == x {
                xParent = parent
                xDepth = depth
            } else if node.val == y {
                yParent = parent
                yDepth = depth
            } else {
                dfs(node.left, node.val, depth+1)
                dfs(node.right, node.val, depth+1)
                
            }
        }
        
        dfs(root, -1, 0)
        
        return (xParent != yParent && xDepth == yDepth)
    }
}