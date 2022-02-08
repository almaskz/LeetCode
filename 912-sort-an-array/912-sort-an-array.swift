class Solution {
    func sortArray(_ nums: [Int]) -> [Int] {
        var arr = nums
        
        mergeSort(&arr, 0, arr.count-1)
        return arr
    }
    
    func mergeSort(_ arr: inout [Int], _ start: Int, _ end: Int) {
        if start < end {
            let mid = start + (end-start+1)/2  
            mergeSort(&arr, start, mid-1)        
            mergeSort(&arr, mid, end)
            merge(&arr,start, mid-1, end)     
        }
    }
    
    func merge(_ arr: inout [Int], _ start: Int, _ mid: Int, _ end: Int) {
        let size = end - start + 1 
        var temp = Array(repeating: 0, count: size)
        
        var l = start, r = mid+1 
        var k = 0
        
        // merge two parts into temp
        while l <= mid && r <= end {
            if arr[l] <= arr[r] {
                temp[k] = arr[l]
                l += 1 
            } else {
                temp[k] = arr[r]
                r += 1
            }
            k += 1
        }
        
        // merge the left part if there is anything left to merge
        while (l <= mid) {
            temp[k] = arr[l]
            l += 1 
            k += 1
        }
        
        // merge the right part if there is anything left to merge
        while (r <= end) {
            temp[k] = arr[r]
            r += 1 
            k += 1
        }
        
        // put everthing from temp into the original array
        // so the sorting is in place
        for i in start...end {
            arr[i] = temp[i-start]   
        }
    }
}