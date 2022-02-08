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
        var cur = head
        var prev: ListNode? = nil
        
        while cur != nil {
            let next = cur?.next
            cur?.next = prev
            prev = cur
            cur = next
        }
        return prev
        
        //1->2->3->4->5
          
        // 5->nil
        // c  n
    }
    
    // 1, nil | 
    /*
    func recursive(_ node: ListNode?, _ prev: inout ListNode?) -> ListNode? {
        guard let node = node else { return nil }
        
        let next = node.next
        node.next = prev
        prev = node
        node = next
        
        return recursive(node.next, node)
    }*/
}