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
        //var prev: ListNode?
        return iterative(head)
    }
    
    func recursive(_ node: ListNode?, _ prev: ListNode?) -> ListNode? {
        if node == nil {
            return prev
        }
        var next = node?.next
        node?.next = prev
        return recursive(next, node)
    }
    
    func iterative(_ node: ListNode?) -> ListNode? {
        var prev: ListNode? = nil
        var cur = node
        var next: ListNode?
        while cur != nil {
            next = cur?.next
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