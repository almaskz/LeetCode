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
    func maxDepth(_ root: TreeNode?) -> Int {
        return bfs(root)
    }
    
    func helper(_ node: TreeNode?, _ depth: Int) -> Int {
        guard let node = node else { return depth }
        
        let left = helper(node.left, depth+1)
        let right = helper(node.right, depth+1)
        
        return left > right ? left : right
    }
    
    func bfs(_ node: TreeNode?) -> Int {
        guard let node = node else { return 0 }
        var queue = [TreeNode]()
        var distance = 0
        queue = [node]
        
        while queue.isEmpty == false {
            var nextQueue = [TreeNode]()
            for item in queue {
                if let left = item.left {
                    nextQueue.append(left)
                }   
                if let right = item.right {
                    nextQueue.append(right)
                }
            }
            distance += 1
            queue = nextQueue
        }
        return distance
    }
}