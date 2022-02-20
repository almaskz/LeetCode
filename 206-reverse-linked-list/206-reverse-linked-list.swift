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
        //   1<-2<-3<-4<-5   <- | ->
        //nil<-1  2->3->4<-5->nil
        //  p  c  n
        return iterative(head)
    }
    
    func iterative(_ node: ListNode?) -> ListNode? {
        var prev: ListNode? = nil
        var cur = node
        
        while cur != nil {
            let next = cur?.next
            cur?.next = prev
            prev = cur
            cur = next
        }
        return prev
    }
    
    func helper(_ node: ListNode?) -> ListNode? {
        if node == nil || node?.next == nil {
            return node    
        }
        let last = helper(node?.next)
        node?.next?.next = node
        node?.next = nil
        return last
    }
}