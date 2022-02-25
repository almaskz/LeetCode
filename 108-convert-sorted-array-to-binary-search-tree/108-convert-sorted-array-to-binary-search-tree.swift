/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        return helper(nums, 0, nums.count-1)
    }  
    
    //   0  1 2 3 4  5
    //[-10,-3,0,5,9,10]
    //[lo   mid-1][mid  hi]
    // mid = 0+(5-0+1)/2=3
    // 
    
    func helper(_ nums: [Int], _ lo: Int, _ hi: Int) -> TreeNode? {
        guard lo <= hi else { return nil }
        
        let mid = lo+(hi-lo+1)/2
        
        let node = TreeNode(nums[mid])
        node.left = helper(nums, lo, mid-1)
        node.right = helper(nums, mid+1, hi)
        return node
    }
}