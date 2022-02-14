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
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        var stack = [(p: TreeNode?, q: TreeNode?)]()
        
        stack.append((p: p, q: q))
        
        while(stack.isEmpty == false) {
            let cur = stack.removeFirst()
            
            if cur.p != nil || cur.q != nil {
                if check(cur) {
                    stack.append((p: cur.p?.left, q: cur.q?.left))
                    stack.append((p: cur.p?.right, q: cur.q?.right))
                } else {
                    return false
                }
            }
        }
        
        return true
    }
    
    func check(_ item: (p: TreeNode?, q: TreeNode?)) -> Bool {
         return item.p?.val == item.q?.val
    }
}