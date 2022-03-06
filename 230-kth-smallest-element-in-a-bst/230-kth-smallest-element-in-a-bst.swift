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
    var kthItem: Int?
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        var stack = [TreeNode]()
        var cur = root
        
        var count = 0
        
        while cur != nil || stack.isEmpty == false {
            while cur != nil {
                stack.append(cur!)
                cur = cur?.left
            }
            cur = stack.removeLast()
            count += 1
            if count == k {
                return cur!.val
            }
            cur = cur?.right
        }
        
        return cur!.val
        
        //let arr = inorder(root, k)
        //return arr[k-1]
    }
    
    func inorder(_ root: TreeNode?, _ k: Int) -> [Int] {
        guard let node = root else { return [] }
        
        let left = inorder(node.left, k)
        if left.count > k {
            return left
        }
        let right = inorder(node.right, k)
        
        return left + [node.val] + right
    }
}