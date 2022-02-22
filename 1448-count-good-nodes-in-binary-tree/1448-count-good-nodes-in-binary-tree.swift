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
    
    func goodNodes(_ root: TreeNode?) -> Int {
        guard let node = root else { return 0 }
        var count = 0
        
        func countGoodNodes(_ node: TreeNode, _ curMax: Int) {
            if node.val >= curMax {
                count += 1
            }
            
            if let left = node.left {
                countGoodNodes(left, max(left.val, curMax))
            }
            if let right = node.right {
                countGoodNodes(right, max(right.val, curMax))
            }
        }
        
        countGoodNodes(node, node.val)
        return count
    }
}