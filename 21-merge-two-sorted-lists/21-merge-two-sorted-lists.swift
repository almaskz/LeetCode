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
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        /*
        1->2->4
        1->3->4
        */
        var newHead = ListNode()
        var cur: ListNode? = newHead
        var node1 = list1
        var node2 = list2
        
        while node1 != nil && node2 != nil {
            if node1!.val < node2!.val {
                cur?.next = node1
                node1 = node1?.next
            } else {
                cur?.next = node2
                node2 = node2?.next
            }
            cur = cur?.next
        }
        
        if node1 != nil {
            cur?.next = node1
        }
        
        if node2 != nil {
            cur?.next = node2
        }
        
        return newHead.next
    }
}