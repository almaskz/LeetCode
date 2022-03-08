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
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        var stack1 = [TreeNode]()
        var stack2 = [TreeNode]()
        
        var result = [Int]()
        guard let node = root else { return result }
        stack1.append(node)
        
        while stack1.isEmpty == false {
            let cur = stack1.removeLast()
            stack2.append(cur)
            
            if let left = cur.left {
                stack1.append(left)
            }
            if let right = cur.right {
                stack1.append(right)
            }
        }
        while stack2.isEmpty == false {
            let node = stack2.removeLast()
            result.append(node.val)
        }
        
        return result
    }
}