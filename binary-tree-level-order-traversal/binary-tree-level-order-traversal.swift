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
    var levels = [[Int]]()
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let node = root else { return levels }
        helper(node, 0)
        return levels
    }
    
    func helper(_ node: TreeNode, _ level: Int) {
        if levels.count == level {
            levels.append([Int]())
        }
        levels[level].append(node.val)
        
        if let left = node.left {
            helper(left, level+1)
        }
        if let right = node.right {
            helper(right, level+1)
        }
    }
 
}