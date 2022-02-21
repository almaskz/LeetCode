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
    func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
        var dummy = ListNode(0, head)
        
        //nil<|
        // 1->2<-3<-4  5->nil   left = 2; right = 4
        //             c
        //             n
        //          p
        // s
        
        // get to the left node
        var startP: ListNode? = dummy
        var cur = head
        for i in 0..<left-1 {
            startP = cur
            cur = cur?.next
        }
        // reverse from left to right
        var prev: ListNode? = nil
        for i in left...right {
            let next = cur?.next
            cur?.next = prev
            prev = cur
            cur = next
        }
        
        // connect ends from left and right
        startP?.next?.next = cur
        startP?.next = prev 
        
        return dummy.next
    }
}