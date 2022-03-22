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
    func reverseList(_ head: ListNode?) -> ListNode? {
        var prev: ListNode? = nil
        /*var cur: ListNode? = head
        
        while cur != nil {
            let next = cur?.next
            cur?.next = prev
            prev = cur
            cur = next
        }
        
        return prev*/
        return helper(head, prev)
    }
    // 1 -> 2 -> 3 -> 4 -> 5 -> nil
    // 1 -> nil   2-> 3 -> 4 -> 5 -> nil
    
    
    // (1, nil)
    // (2, 1)
    func helper(_ node: ListNode?, _ prev: ListNode?) -> ListNode? {
        // base case 
        guard let cur = node else { return prev }
        
        let next = cur.next         // 2 | 3 
        cur.next = prev             // 1->nil | 3-> 1 
        
        return helper(next, cur)    // (2, 1)
    }
}