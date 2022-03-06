/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

class Solution {
    func lowestCommonAncestor(_ root: TreeNode?,
                              _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard let node = root else { return nil }
        
        if node.val > p!.val && node.val > q!.val {
            return lowestCommonAncestor(node.left, p, q)
        } else if node.val < p!.val && node.val < q!.val {
            return lowestCommonAncestor(node.right, p, q)
        } else {
            return node
        }     
    }
}