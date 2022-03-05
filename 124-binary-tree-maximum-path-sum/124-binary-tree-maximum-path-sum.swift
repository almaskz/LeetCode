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
    var maxSoFar = Int.min                      //  42
    
    // -10
    func maxPathSum(_ root: TreeNode?) -> Int {
        let _ = helper(root)
        return maxSoFar
    }
    
    func helper(_ root: TreeNode?) -> Int {
        // base case 
        guard let node = root else { return 0 }
        
        let left = max(helper(node.left), 0)
        let right = max(helper(node.right), 0)
        
        let pathSum = node.val + left + right           // 41
        
        maxSoFar = max(maxSoFar, pathSum)         
        
        return node.val + max(left, right)
    }
}