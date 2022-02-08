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
    func insertIntoBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        var cur = root
        while cur != nil {
            if val < cur!.val {
                if cur?.left == nil {
                    cur?.left = TreeNode(val)
                    return root
                } 
                cur = cur?.left
            } else {
                if cur?.right == nil {
                    cur?.right = TreeNode(val)
                    return root
                }
                cur = cur?.right
            }
        }
        
        return TreeNode(val)
    }
}