class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var freqs = [Int: Int]()
        
        for i in nums {
            freqs[i, default: 0] += 1
        }
        
        var list = Array(freqs.keys)
        
        var l = 0, r = list.count - 1
        
        /*
        01234
        12345
          m
        [0..mid][mid+1..]
        */
        
        while l < r {
            let mid = quickSelect(&list, l, r, freqs)
            if list.count - mid < k {
                r = mid - 1
            } else if list.count - mid > k {
                l = mid + 1
            } else {
                return Array(list[(list.count-k)...])
            }
        }
        return Array(list[(list.count-k)...])
    }
    
    // [1,1,1,2,2,3]
    // [1] = 3 ; [2] = 2 ; [3] = 1
    //        0 1 2
    // list = 3 2 1 k = 2   
    
    func quickSelect(_ arr: inout [Int], _ lo: Int, _ hi: Int, _ freqs: [Int: Int]) -> Int {
        let pivotIndex = Int.random(in: lo..<hi)
        
        arr.swapAt(hi, pivotIndex)
        
        var left = lo
        for i in lo..<hi {
            if freqs[arr[i]]! <= freqs[arr[hi]]! {
                arr.swapAt(i, left)
                left += 1
            }
        }
        
        arr.swapAt(left, hi)
        
        return left
    }
}