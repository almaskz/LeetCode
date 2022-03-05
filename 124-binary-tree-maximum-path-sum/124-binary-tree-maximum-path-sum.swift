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
    func maxPathSum(_ root: TreeNode?) -> Int {
        var maxPath = Int.min
        let maxPathCountingRoot = helper(root, &maxPath)
        return maxPath
    }
    
    func helper(_ root: TreeNode?, _ maxPath: inout Int) -> Int {
        // base case 
        guard let node = root else { return 0 }
        
        // do we even gain anything from left side
        let leftGain = max(helper(node.left, &maxPath), 0)  
        // do we gain anything from right side
        let rightGain = max(helper(node.right, &maxPath), 0)
        
        let curPathSum = node.val + leftGain + rightGain
        // update max
        maxPath = max(maxPath, curPathSum)         
        
        // when we return back in recursion, we have to chose left or right gains 
        return node.val + max(leftGain, rightGain)
    }
}