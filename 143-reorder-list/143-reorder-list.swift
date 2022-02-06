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
    func reorderList(_ head: ListNode?) {
        // 1->2->3->4->5
        //       s       
        //                f
        // 5->4->3->2->1
        // 1->5->2->4->3->nil
        
        
        // 1) Find the middle of the list
        var slow = head
        var fast = head?.next
        
        while fast != nil && fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        
        // create a point for the 2nd half of the original list
        var second = slow?.next
        // break 2 lists
        slow?.next = nil 
        
        // 2) reverse the 2nd list    
        var list2 = reverse(second)
        
        // 3) merge 2 lists
        var list1 = head
        while list2 != nil {
            var next1 = list1?.next
            var next2 = list2?.next
            list1?.next = list2
            list2?.next = next1
            list1 = next1
            list2 = next2
        }
    }
    
    func reverse(_ node: ListNode?) -> ListNode? {
        var prev: ListNode? = nil
        var cur = node
        
        while cur != nil {
            let temp = cur?.next
            cur?.next = prev
            prev = cur
            cur = temp
        }
        return prev
    }
}