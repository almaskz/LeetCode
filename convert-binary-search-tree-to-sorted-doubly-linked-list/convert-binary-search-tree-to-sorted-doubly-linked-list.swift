/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var left: Node?
 *     public var right: Node?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

class Solution {
    var first: Node? = nil
    var last: Node? = nil
    func treeToDoublyList(_ root: Node?) -> Node? {
        guard let node = root else { return nil }
        
        helper(node)
        last?.right = first
        first?.left = last
        return first
    }
    
    func helper(_ node: Node?) {
        if let node = node {
            helper(node.left)
            
            if last != nil {
                last?.right = node
                node.left = last
            } else {
                first = node
            }
            last = node
            helper(node.right)
        } 
    }
}