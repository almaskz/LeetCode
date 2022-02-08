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
    func findLeaves(_ root: TreeNode?) -> [[Int]] {
        var ans = [[Int]]()
        
        func getHeight(_ root: TreeNode?)  -> Int {
            guard let node = root else {
                return -1
            }
        
            let left = getHeight(node.left)
            let right = getHeight(node.right)
            let currentHeight = max(left, right)+1
            
            if ans.count <= currentHeight {
                ans.append([node.val])
            } else {
                ans[currentHeight].append(node.val)
            }
            
            return currentHeight
        }
        
        let _ = getHeight(root)
        return ans 
    }
    
    
}