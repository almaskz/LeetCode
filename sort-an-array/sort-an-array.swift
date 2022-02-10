class Solution {
    func sortArray(_ nums: [Int]) -> [Int] {
        guard nums.count > 1 else { return nums }
        var arr = nums
        mergeSort(&arr, 0, nums.count-1)
        return arr
    }
    /*
    0 1 2 3
    5 2 3 1
    
    */
    
    // 0 3
    // 0 1
    func mergeSort(_ arr: inout[Int], _ left: Int, _ right: Int) {
        if left < right {
            let mid = left + (right-left+1)/2       // mid = 2 | 1
            mergeSort(&arr, left, mid-1)            //         
            mergeSort(&arr, mid, right)             // 
            merge(&arr, left, mid-1, right)         // 0, 0, 1 
        }
    }
    
    // 5 2 3 1
    // 0 0 1 | 
    func merge(_ arr: inout [Int], _ left: Int, _ mid: Int, _ right: Int) {
        let size = right - left + 1                 // 2
        var temp = Array(repeating: 0, count: size) // temp = [0, 0]
        
        var k = 0
        var l = left                            // l = 0
        var r = mid+1                           // r = 1
        
        while l <= mid && r <= right {          
            if arr[l] <= arr[r] {               // 
                temp[k] = arr[l]
                l += 1
            } else {
                temp[k] = arr[r]                // temp = [2,0]
                r += 1                          // r = 2
            }  
            k += 1                              // k = 1
        }
        
        while l <= mid {
            temp[k] = arr[l]                    // temp = [2, 5]
            l += 1                              // l = 1
            k += 1
        }
        
        while r <= right {
            temp[k] = arr[r]
            r += 1
            k += 1
        }
        
        for i in left...right {
            arr[i] = temp[i-left]               // arr = [2 5 3 1]
        }
    }
}