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
    func flatten(_ root: TreeNode?) {
        let _ = helper(root)
    }
    
    func helper(_ node: TreeNode?) -> TreeNode? {
        guard let node = node else { return nil }
        
        let leftTail = helper(node.left)
        let rightTail = helper(node.right)
        
        if leftTail != nil {
            leftTail?.right = node.right
            node.right = node.left
            node.left = nil
        }
        
        if rightTail != nil {
            return rightTail
        } else if leftTail != nil {
            return leftTail
        } else {
            return node
        }
    }
}