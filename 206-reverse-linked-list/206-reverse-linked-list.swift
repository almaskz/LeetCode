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
        return recursiveReverse(head, nil)
    }
    
    func recursiveReverse(_ cur: ListNode?, _ prev: ListNode?) -> ListNode? {
        guard let node = cur else { return prev }
        
        let next = cur?.next
        cur?.next = prev
        return recursiveReverse(next, cur)
    }
}