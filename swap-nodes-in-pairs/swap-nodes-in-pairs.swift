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
    func swapPairs(_ head: ListNode?) -> ListNode? {
        // base case 
        if head == nil || head?.next == nil {
            return head
        }
        
        // sublist
        var sublist = head?.next?.next
        var newHead = head?.next
        head?.next?.next = head
        head?.next = swapPairs(sublist)
        return newHead 
        //1->2->3->4
        //   n 
        //h
        //2->1->..
        
        
    }
}