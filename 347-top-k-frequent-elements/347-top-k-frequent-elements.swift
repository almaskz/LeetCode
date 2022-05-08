class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        //[1,1,1,2,2,3]
        let n = nums.count
        var freqs = [Int: Int]() // the number and its freqency
        for num in nums {
            freqs[num, default: 0] += 1 
        }
        print("Here2")
        // bucket sorting with the freqs
        var bucket = Array(repeating: [Int](), count: n+1)
        for elem in freqs {
            bucket[elem.value].append(elem.key)
        }
        
        var result = [Int]()
        
        for i in stride(from: n, through: 1, by: -1) {
            if bucket[i].isEmpty == false {
                result.append(contentsOf: bucket[i])
            }
            
            if result.count == k {
                return result
            }             
        }
        return result
    }
}