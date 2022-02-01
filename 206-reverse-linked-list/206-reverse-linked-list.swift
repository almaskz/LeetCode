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
        // 1 -> 2 -> 3 -> 4 -> 5
        // c
        // pre 
        
        var pre: ListNode? = nil
        var cur = head
        
        while cur != nil {
            let next = cur?.next
            cur?.next = pre
            pre = cur
            cur = next
        }
        
        return pre
    }
}