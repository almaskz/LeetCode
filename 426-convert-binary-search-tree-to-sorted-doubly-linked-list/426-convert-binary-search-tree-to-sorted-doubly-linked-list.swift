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
    func treeToDoublyList(_ root: Node?) -> Node? {
        var head: Node? = nil
        var tail: Node? = nil
        var node = root
        recurse(node, &head, &tail)
        head?.left = tail
        tail?.right = head
        return head
    }
    
    func recurse(_ node: Node?, _ head: inout Node?, _ tail: inout Node?) {
        guard var node = node else { return }
        
        recurse(node.left, &head, &tail)
        
        if tail != nil {
            tail?.right = node
            node.left = tail
        } else {
            head = node
        }
        tail = node
        recurse(node.right, &head, &tail)
    }
}