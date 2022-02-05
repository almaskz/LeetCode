/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        // (0)->1->2->3->4->5->nil        n = 2
        //            l        r     
        
        var dummy = ListNode(0, head)
        var left: ListNode? = dummy
        
        var right: ListNode? = head
        var count = 0
        
        while count < n && right != nil {
            right = right?.next
            count += 1
        }
        
        while right != nil {
            left = left?.next
            right = right?.next
        }
        
        left?.next = left?.next?.next
        
        return dummy.next
    }
}