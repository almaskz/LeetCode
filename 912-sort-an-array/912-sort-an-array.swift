class Solution {
    /*
     0 1 2 3
     2,1,3,5
         p
         i
         l
    return 2
    [2 1] [3]
    */
    
    func sortArray(_ nums: [Int]) -> [Int] {
        var arr = nums
        quickSort(&arr, 0, nums.count-1)
        return arr
    }
    
    func quickSort(_ arr: inout [Int], _ start: Int, _ end: Int) {
        if start < end {
            let p = helper(&arr, start, end)
            quickSort(&arr, start, p-1)
            quickSort(&arr, p+1, end)
        }
    }
    
    func helper(_ arr: inout [Int], _ start: Int, _ end: Int) -> Int {
        var partition = Int.random(in: start..<end)
        
        arr.swapAt(partition, end)
        
        var l = start
        for i in start..<end {
            if arr[i] <= arr[end] {
                arr.swapAt(i, l)
                l += 1
            }
        }
        
        arr.swapAt(l, end)
        return l
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