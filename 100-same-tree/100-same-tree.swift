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
        return bfs(p, q)
    }
    
    func bfs(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil && q == nil { return true }
        guard let pNode = p, let qNode = q else { return false }
        
        var pQueue = [TreeNode]()
        var qQueue = [TreeNode]()
        
        pQueue.append(pNode)
        qQueue.append(qNode)
        
        while pQueue.isEmpty == false && qQueue.isEmpty == false {
            if pQueue.count != qQueue.count { return false }
            var nextP = [TreeNode]()
            var nextQ = [TreeNode]()
            for i in 0..<pQueue.count {
                let curP = pQueue[i]
                let curQ = qQueue[i]
                if curP.val != curQ.val { return false }
    
                if (curP.left == nil) != (curQ.left == nil) {
                    return false
                }
                if (curP.right == nil) != (curQ.right == nil) {
                    return false
                }
                if let pLeft = curP.left {
                    nextP.append(pLeft)
                } 
                if let qLeft = curQ.left {
                    nextQ.append(qLeft)
                }
                if let pRight = curP.right {
                    nextP.append(pRight)
                } 
                if let qRight = curQ.right {
                    nextQ.append(qRight)
                }
            }
            pQueue = nextP
            qQueue = nextQ
        }
        
        return true
    }
}