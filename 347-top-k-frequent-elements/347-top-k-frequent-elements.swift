class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var freqs = [Int: Int]()
        for i in nums {
            freqs[i, default: 0] += 1
        }

        var list = Array(freqs.keys)	// [3 1 2]

        var l = 0, r = list.count-1
        // 0 1 2 3 4 5
        // 1 2 3 4 5 6
        // [...p][p+1…]

        while l < r {
            let pivot = quickSelect(freqs, &list, l, r)

            if list.count - pivot < k {
                r = pivot - 1
            } else if list.count - pivot > k {
                l = pivot + 1
            } else {
                return Array(list[(list.count-k)...])
            } 	
        }
        return Array(list[(list.count-k)...])

    }
     
    func quickSelect(_ freqs: [Int: Int], _ arr: inout [Int], _ lo: Int, _ hi: Int) -> Int {
        let pivotIndex = Int.random(in: lo..<hi)
        arr.swapAt(pivotIndex, hi)

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