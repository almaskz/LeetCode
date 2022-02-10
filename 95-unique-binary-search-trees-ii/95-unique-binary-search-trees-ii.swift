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
    func generateTrees(_ n: Int) -> [TreeNode?] {
        var ans = [TreeNode?]() 
        if n == 0 {
            return ans
        } 
        return genTrees(1, n)
    }
    
    func genTrees(_ start: Int, _ end: Int) -> [TreeNode?] {
        var allTrees = [TreeNode?]() 
        
        if start > end {
            allTrees.append(nil)
            return allTrees
        }
        
        // interate with all roots 
        for i in start...end {
            // i is root, get trees for the left side (start, i-1)
            var left = genTrees(start, i-1)
            
            // get trees for the right side (i+1, end)
            var right = genTrees(i+1, end)
            
            // connect left and right to the root i
            for l in left {
                for r in right {
                    var cur = TreeNode(i, l, r)
                    allTrees.append(cur)
                }
            }
        }
        return allTrees
    }
}