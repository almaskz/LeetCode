class Solution {
    func findMin(_ nums: [Int]) -> Int {
        //[3,4,5,1,2]   min =
        //[4,5,6,7,0,1,2]
        //[5,1,2,3,4]
        // l   m   r
        //
        
        var result = nums[0]
        var l = 0, r = nums.count-1
        while l <= r {
            if nums[l] < nums[r] {
                return min(result, nums[l])
            } else {
                let m = (l+r)/2
                result = min(result, nums[m])
                if nums[l] > nums[m] {
                    // search left
                    r = m-1
                } else {
                    // search right                    
                    l = m+1
                }   
            }
        }
        
        return result
    }
}