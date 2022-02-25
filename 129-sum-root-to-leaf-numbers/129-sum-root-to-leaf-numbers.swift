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
    func sumNumbers(_ root: TreeNode?) -> Int {
        return dfs(root, 0)
    }
    // 1 2 3
    // 1, "", 0
    // left = 2, "1", 0
    // right = 3, 
    func dfs(_ node: TreeNode?, _ sum: Int) -> Int {
        guard let node = node else { return 0 }
    
        let num = sum*10 + node.val
        if node.left == nil && node.right == nil {
            return num
        }  
        
        return dfs(node.left, num) + dfs(node.right, num)   
    }
}