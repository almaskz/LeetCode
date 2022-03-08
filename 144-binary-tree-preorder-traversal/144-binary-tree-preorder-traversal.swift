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
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        var result = [Int]()
        
        if root == nil { return result }
        var stack = [root!]        
    
        while stack.isEmpty == false {
            let pop = stack.removeLast()
            result.append(pop.val)
            
            if let right = pop.right {
                stack.append(right)
            }
            if let left = pop.left {
                stack.append(left)
            }
        }
        
        return result
    }
}