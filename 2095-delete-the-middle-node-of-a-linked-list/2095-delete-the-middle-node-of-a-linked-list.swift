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
    func deleteMiddle(_ head: ListNode?) -> ListNode? {
        // [1,3,4,7,1]
        //    s
        //          f
        // [1,3,4,7]
        //    s
        //          f  
        
        var dummy = ListNode(0, head)
        var slow: ListNode? = dummy
        var fast = head
        
        while fast != nil && fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        
        slow?.next = slow?.next?.next
        return dummy.next
    }
}