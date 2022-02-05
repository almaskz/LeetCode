/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

class Solution {
    func hasCycle(_ head: ListNode?) -> Bool {
        //guard var node = head else { return false }
        //var visited = Set<ObjectIdentifier>()
        //return dfs(node, &visited)
        
        var fast = head?.next?.next
        var slow = head?.next
        
        while fast != nil && slow !== fast {
            fast = fast?.next?.next
            slow = slow?.next
        }
        
        return slow != nil && fast === slow 
    }
    
    
    
    func dfs(_ node: ListNode, _ visited: inout Set<ObjectIdentifier>) -> Bool {
        visited.insert(ObjectIdentifier(node))
        
        guard var next = node.next else { return false }
        if visited.contains(ObjectIdentifier(next)) {
            return true
        } else {
            return dfs(next, &visited)
        }
    }    
}