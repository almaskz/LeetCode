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
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let node = root else { return [[Int]]() }
        
        var stack = [TreeNode]()        
        var ans = [[Int]]()
        
        stack.append(node)
        while stack.isEmpty == false {
            let levelSize = stack.count
            var result = [Int]()
            result.reserveCapacity(levelSize)
            
            for i in 0..<levelSize {
                let cur = stack.removeFirst()
                result.append(cur.val)
                if let left = cur.left {
                    stack.append(left)
                }
                if let right = cur.right {
                    stack.append(right)
                }
            }
            ans.append(result)
        }
        
        return ans
    }
 
}