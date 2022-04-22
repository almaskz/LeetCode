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
    func convertBST(_ root: TreeNode?) -> TreeNode? {
        var curSum = 0  //
        
        func dfs(_ node: TreeNode?) {
            guard let node = node else { return }
            dfs(node.right)     //
            curSum += node.val  // 26
            node.val = curSum   // 26
            dfs(node.left)      // 
        }
        
        dfs(root)
        return root // (4) | (6) | (5) 
    }
}