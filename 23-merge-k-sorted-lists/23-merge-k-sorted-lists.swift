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
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        //[[1,4,5],[1,3,4],[2,6]]
        if lists.count == 0 {
            return nil
        } else if lists.count == 1 {
            return lists[0]
        }
        
        return mergeSort(lists, 0, lists.count-1)
    }
    
    func mergeSort(_ lists: [ListNode?], _ start: Int, _ end: Int) -> ListNode? {
        if start == end {
            return lists[start]
        }
        
        while start < end {
            let middle = start + (end-start + 1)/2
            let l1 = mergeSort(lists, start, middle-1)
            let l2 = mergeSort(lists, middle, end)
            return mergeTwo(l1, l2)
        }
        
        return nil
    }
    
    
    func mergeTwo(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        guard let list1 = list1 else { return list2 }
        guard let list2 = list2 else { return list1 }
        
        if list1.val < list2.val {
            list1.next = mergeTwo(list1.next, list2)
            return list1
        } else {
            list2.next = mergeTwo(list1, list2.next)
            return list2
        }   
    }
}