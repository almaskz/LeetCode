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
        func countGoodNodes(_ node: TreeNode?, _ curMax: Int) -> Int {
            guard let node = node else { return 0 }    
            
            let left = countGoodNodes(node.left, max(node.val, curMax))
            let right = countGoodNodes(node.right, max(node.val, curMax))
            var cur = 0
            if node.val >= curMax {
                cur += 1
            }
            return cur + left + right
        }
        
        guard let node = root else { return 0 }    
        return countGoodNodes(node, node.val)
    }
}