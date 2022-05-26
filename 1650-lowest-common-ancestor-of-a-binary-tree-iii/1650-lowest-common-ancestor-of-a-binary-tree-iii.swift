/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var left: Node?
 *     public var right: Node?
 *     public var parent: Node?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *         self.parent = nil
 *     }
 * }
 */

class Solution {
    func lowestCommonAncestor(_ p: Node?,_ q: Node?) -> Node? {
        var set = Set<Int>()
        
        var cur = p
        while cur != nil {
            set.insert(cur!.val)
            cur = cur?.parent
        }
        
        cur = q
        while cur != nil && set.contains(cur!.val) == false {
            cur = cur?.parent
        }
        
        return cur
    }
}