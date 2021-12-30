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
        var fast = head?.next?.next
        var slow = head?.next
        
        while(fast != nil && slow != nil && slow !== fast) {
            fast = fast?.next?.next
            slow = slow?.next
        }
        
        //print(fast != nil)
        //print(fast === slow)
            
        return fast != nil && fast === slow
    }
}