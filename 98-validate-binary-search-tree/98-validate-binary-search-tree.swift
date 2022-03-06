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
    //[5,1,4,null,null,3,6]
    func isValidBST(_ root: TreeNode?) -> Bool {
        return helper(root, nil, nil)
    }
    
    // 5 nil nil
    // 1 nil, 5
    // 4 5, nil
    // 
    func helper(_ node: TreeNode?, _ minVal: Int?, _ maxVal: Int?) -> Bool {
        guard let node = node else { return true }
        
        if let minBound = minVal {
            if node.val <= minBound {
                return false
            }
        }
        if let maxBould = maxVal {
            if node.val >= maxBould {
                return false
            }
        }
        return helper(node.left, minVal, node.val) && helper(node.right, node.val, maxVal)
    }
}