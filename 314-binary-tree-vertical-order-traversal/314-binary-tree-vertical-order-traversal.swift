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
    func verticalOrder(_ root: TreeNode?) -> [[Int]] {
        guard let node = root else { return [] }
        var queue = [(node: TreeNode, col: Int)]()
        queue.append((node: node, col: 0))
        
        var maxCol = Int.min
        var minCol = Int.max
        
        var dict = [Int: [Int]]() // col : [value]
        while queue.isEmpty == false {
            let cur = queue.removeFirst()
            if cur.col > maxCol {
                maxCol = cur.col
            }
            if cur.col < minCol {
                minCol = cur.col
            }
            dict[cur.col, default: [Int]()].append(cur.node.val)
            if let left = cur.node.left {
                queue.append((node: left, col: cur.col - 1))
            }
            if let right = cur.node.right {
                queue.append((node: right, col: cur.col + 1))
            }
        }
        
        var result = [[Int]]()
        for i in minCol...maxCol {
            if let value = dict[i] {
                result.append(value)
            }
        }
        return result
    }
}