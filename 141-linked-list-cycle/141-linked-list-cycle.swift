/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

class Solution {
    func hasCycle(_ head: ListNode?) -> Bool {
        /*
        3->2->0->-4 ->2
                  s
                  f
        1->2->1
        s
        f
        */
        
        var slow = head?.next
        var fast = head?.next?.next
        
        while fast != nil && slow !== fast {
            slow = slow?.next
            fast = fast?.next?.next
        }
        
        if fast != nil && fast === slow {
            return true 
        } else {
            return false 
        }
    }
}