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
        var dymmy: ListNode? = ListNode(0, head)
        
        var startP = dymmy
        var cur = head
        for i in 0..<left-1 {
            startP = cur
            cur = cur?.next
        }
        
        var prev: ListNode?
        
        for i in left...right {
            let next = cur?.next
            cur?.next = prev
            prev = cur
            cur = next
        }
        
        startP?.next?.next = cur
        startP?.next = prev
        
        //      |
        //   1->2<-3<-4  5->nil
        //         p  c  n
        //   sP
        return dymmy?.next
    }
}