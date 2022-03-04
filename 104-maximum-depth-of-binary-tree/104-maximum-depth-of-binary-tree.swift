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
    func maxDepth(_ root: TreeNode?) -> Int {
        return helper(root, 0)
    }
    
    func helper(_ node: TreeNode?, _ depth: Int) -> Int {
        guard let node = node else { return depth }
        
        let left = helper(node.left, depth+1)
        let right = helper(node.right, depth+1)
        
        return left > right ? left : right
    }
}