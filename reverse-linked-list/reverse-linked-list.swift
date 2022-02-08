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
        return recursive(head, nil)
    }
    
    // 1, nil | 
    func recursive(_ node: ListNode?, _ prev: ListNode?) -> ListNode? {
        guard let node = node else { return prev }
        
        let next = node.next
        node.next = prev
        return recursive(next, node)
    }
}