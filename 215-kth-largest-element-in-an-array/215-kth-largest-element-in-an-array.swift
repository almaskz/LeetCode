class Solution {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        // 1  2 3 4 5 6
        //                  p
        // [3,6,4,5,5,3,2,1,2]  k = 4  >=
        //                  i
        //            l
        // [..p] [p+1..]
        /*
         0 1 2 3 4 5
        [3,2,1,5,6,4]
        [3,2,4,5,6,1]
        */
        
        var arr = nums
        
        func quickSelect(_ lo: Int, _ hi: Int) -> Int {
            let pivotIndex = Int.random(in: lo..<hi)
            //print("pivot = \(arr[pivotIndex])")
            arr.swapAt(pivotIndex, hi)
            var left = lo
            for i in lo..<hi {
                if arr[i] <= arr[hi] {
                    arr.swapAt(i, left)
                    left += 1
                }
            }
            
            arr.swapAt(hi, left)
            return left
        }
        
        var l = 0, r = nums.count - 1
        
        while l < r {
            let target = quickSelect(l, r)
            //print("target = \(target)")
            //print(arr)
            if nums.count - target < k {
                r = target - 1  
            } else if nums.count - target > k {
                l = target + 1
            } else {
                return arr[nums.count-k]
            }
        }
        return arr[nums.count-k]
    }
}