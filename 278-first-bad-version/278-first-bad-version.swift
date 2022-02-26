/**
 * The knows API is defined in the parent class VersionControl.
 *     func isBadVersion(_ version: Int) -> Bool{}
 */

class Solution : VersionControl {
    func firstBadVersion(_ n: Int) -> Int {
        var l = 1
        var r = n
        // [1 ... mid-1] [mid...]
        
        while l < r {
            let mid = l + (r-l+1)/2
            if isBadVersion(mid) {
                r = mid - 1
            } else {
                l = mid
            }
        }
        
        return isBadVersion(l) ? l : l + 1
    }
}