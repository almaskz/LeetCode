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
    func isSubtree(_ root: TreeNode?, _ subRoot: TreeNode?) -> Bool {
        if subRoot == nil {
            return true
        } else if root == nil {
            return false
        }
        
        if sameTree(root, subRoot) {
            return true
        } else {
            return (isSubtree(root?.left, subRoot) || 
                    isSubtree(root?.right, subRoot))
        }
    }
    
    func sameTree(_ node1: TreeNode?, _ node2: TreeNode?) -> Bool {
        if node1 == nil && node2 == nil {
            return true
        } else if node1?.val == node2?.val {
            return (sameTree(node1?.left, node2?.left) && 
                    sameTree(node1?.right, node2?.right))
        } else {
            return false
        }
    }
}