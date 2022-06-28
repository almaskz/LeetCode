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
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        var maxDiameterSoFar = 0 
        
        func findHeight(_ node: TreeNode?) -> Int {
            guard let node = node else { return 0 }

            let leftH = findHeight(node.left)
            let rightH = findHeight(node.right)
            let curDiameter = leftH + rightH
            maxDiameterSoFar = max(maxDiameterSoFar, curDiameter)

            return 1 + max(leftH, rightH)
        }
        
        let _ = findHeight(root)
        
        return maxDiameterSoFar
    }    
}