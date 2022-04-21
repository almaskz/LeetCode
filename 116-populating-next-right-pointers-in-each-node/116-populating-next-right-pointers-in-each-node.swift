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
        guard let node = root else { return nil }
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
    }
}