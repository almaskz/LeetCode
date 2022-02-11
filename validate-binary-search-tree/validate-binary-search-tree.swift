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
 *     }true 
 * }
 */
class Solution {
    func isValidBST(_ root: TreeNode?) -> Bool {
        var prev: Int? = nil
        
        func inorder(_ node: TreeNode?) -> Bool {
            guard let node = node else { return true }

            if inorder(node.left) == false { return false }
            if prev != nil && prev! >= node.val { return false }
            prev = node.val
            return inorder(node.right)
        }
        
        return inorder(root)
    }
}