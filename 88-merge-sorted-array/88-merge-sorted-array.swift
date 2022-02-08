class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var temp = nums1
        
        var l = 0
        var r = 0
        var k = 0
        while (l < m && r < n) {
            if temp[l] <= nums2[r] {
                nums1[k] = temp[l]
                l += 1
            } else {
                nums1[k] = nums2[r]
                r += 1
            }
            k += 1
        }
        
        while (l < m) { 
            nums1[k] = temp[l]
            l += 1
            k += 1
        }
        
        while (r < n) { 
            nums1[k] = nums2[r]
            r += 1
            k += 1
        }
    }
}