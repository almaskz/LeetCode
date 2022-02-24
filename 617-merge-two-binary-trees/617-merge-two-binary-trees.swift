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
    func mergeTrees(_ root1: TreeNode?, _ root2: TreeNode?) -> TreeNode? {
        if let node1 =  root1, let node2 = root2 {
            let node = TreeNode(node1.val+node2.val)
            let left = mergeTrees(node1.left, node2.left)
            let right = mergeTrees(node1.right, node2.right)
            node.left = left
            node.right = right
            return node
        } else if let node1 = root1 {
            return node1
        } else if let node2 = root2 {
            return node2
        }
        return nil
    }
}