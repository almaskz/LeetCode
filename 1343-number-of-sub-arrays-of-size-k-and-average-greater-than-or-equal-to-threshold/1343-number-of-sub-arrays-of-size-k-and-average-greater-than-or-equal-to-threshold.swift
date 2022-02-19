class Solution {
    func numOfSubarrays(_ arr: [Int], _ k: Int, _ threshold: Int) -> Int {
        //[2,2,2,2,5,5,5,8] => k = 3
        //     i
        var counter = 0
        var sum = 0
        for i in 0..<k {
            sum += arr[i]
        }
        
        var average = getAvg(sum, k)
        if average >= Double(threshold) {
            counter += 1
        }
        
        for i in k..<arr.count {
            sum -= arr[i-k]
            sum += arr[i]
            average = getAvg(sum, k)
            if average >= Double(threshold) {
                counter += 1
            }
        }
        return counter
    }
    
    func getAvg(_ sum: Int, _ n: Int) -> Double {
        return Double(sum)/Double(n)
    }
}