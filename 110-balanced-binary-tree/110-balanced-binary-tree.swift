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
    func isBalanced(_ root: TreeNode?) -> Bool {
        return helper(root).b
    }
    
    func helper(_ node: TreeNode?) -> (h: Int, b: Bool) {
        guard let node = node else { return (h: 0, b: true) }
        
        let left = helper(node.left) 
        let right = helper(node.right)
        
        var balanced = left.b && right.b && abs(left.h - right.h) <= 1
        var height = max(left.h, right.h) + 1
        return (h: height, b: balanced)
    }
}