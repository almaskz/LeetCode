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
        var cur = head
    
        /**
        1->2->3->nil
        p  c 
        */
        
        while cur != nil {
            let next = cur?.next    // 2        | 3     | nil 
            cur?.next = prev        // 1 -> nil | 2->1  | 3->2
            prev = cur              // p = 1    | p = 2 | p = 3
            cur = next              // c = 2    | c = 3 | c = nil
        }
        
        return prev
    }
}