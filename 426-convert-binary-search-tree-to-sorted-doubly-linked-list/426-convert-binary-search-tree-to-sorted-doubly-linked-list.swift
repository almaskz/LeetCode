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
        var first: Node?
        var last: Node?
        helper(root, &first, &last)
        
        first?.left = last
        last?.right = first
        
        return first
    }
    // 4, nil, nil <-
    // 2, nil, nil 
    func helper(_ node: Node?, _ first: inout Node?, _ last: inout Node?) {
        guard let node = node else { return }
        
        helper(node.left, &first, &last)
        
        if last != nil {            // 
            last?.right = node      // 1->right = 2 | 2->right = 3
            node.left = last       // 2->left = 1  | 3->left = 2 
        } else {
            first = node            // first = 1 
        }
        last = node                 // last = 1 | 2  | 3 
        helper(node.right, &first, &last)       // 3, 1, 2 
    }
}