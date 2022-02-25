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
    func isValidBST(_ root: TreeNode?) -> Bool {
        return helper(root, nil, nil)
    }
    
    func helper(_ node: TreeNode?, _ lo: Int?, _ hi: Int?) -> Bool {
        guard let node = node else { return true }
        if let left = lo, left >= node.val {
            return false
        } 
        if let right = hi, right <= node.val {
            return false
        }
        let left = helper(node.left, lo, node.val)
        let right = helper(node.right, node.val, hi)
        return left && right
    }
}