class Solution {
    func nextGreaterElement(_ n: Int) -> Int {
        // 1. Iterate from right to left to find the first element 
        // that is not in increasing order - pIndex
        // 2. Keep track of visited digits ()
        // 3. Swap the first element that is greater that pIndex
        // 4. Sort the [pIndex+1...]
        
        var arr = Array("\(n)")
        var visitedDigits = Array(repeating: -1, count: 10)
        
        var pIndex = -1 
        for i in stride(from: arr.count-1, to: 0, by: -1) {
            visitedDigits[arr[i].wholeNumberValue!] = i
            if arr[i] > arr[i-1] {
                pIndex = i - 1 
                break
            }
        }
        //2147483486
        //
        
        if pIndex == -1 {
            return -1
        }
        
        var eIndexToSwap = 0
        // find the first present number that is greater
        for i in (arr[pIndex].wholeNumberValue! + 1)..<10 {
            if visitedDigits[i] != -1 {
                eIndexToSwap = visitedDigits[i]
                break
            }
        }
        
        arr.swapAt(pIndex, eIndexToSwap)
        let sorted = arr[(pIndex+1)...].sorted()
        let result = arr[0...pIndex] + sorted
        
        let ans = Int(String(result))!
        
        return ans <= Int32.max ? ans : -1
    }
}