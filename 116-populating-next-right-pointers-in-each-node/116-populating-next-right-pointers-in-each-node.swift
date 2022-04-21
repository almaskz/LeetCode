/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var left: Node?
 *     public var right: Node?
 *	   public var next: Node?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *         self.next = nil
 *     }
 * }
 */

class Solution {
    func connect(_ root: Node?) -> Node? {
        var cur = root          // cur = 1
        var next = cur?.left    // next = 2
        
        while next != nil {
            while cur != nil {  // 
                cur?.left?.next = cur?.right        // 2->3 | 4->5 | 6->7 
                cur?.right?.next = cur?.next?.left  // 3->nil | 5->6 | 7->nil
                cur = cur?.next                     // cur = nil | 3 | nil | 
            }
            cur = next          // cur = 2  | 4 
            next = cur?.left    // next = 4 | 
        }
        
        return root
        /*
        var queue = [node]          // [1] 
        
        while queue.isEmpty == false {          // [4 5 6 7]
            var nextLevel = [Node]()            // []
            for i in 0..<queue.count {  
                if i < queue.count-1 {          
                    queue[i].next = queue[i+1]  // 5->6
                }
                if let left = queue[i].left {
                    nextLevel.append(left)      // []
                }
                if let right = queue[i].right {
                    nextLevel.append(right)     // []
                }
            }
            queue = nextLevel                   // [4 5 6 7]
        }
        return node
        */
    }
}