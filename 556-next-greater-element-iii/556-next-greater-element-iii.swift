class Solution {
    func nextGreaterElement(_ n: Int) -> Int {
        // 1. Iterate from right to left to find the first element 
        // that is not in increasing order - pIndex
        // 2. Keep track of visited digits ()
        // 3. Swap the first element that is greater that pIndex
        // 4. Sort the [pIndex+1...]
        
        var arr = Array("\(n)")
        
        var pIndex = -1 
        for i in stride(from: arr.count-1, to: 0, by: -1) {
            if arr[i] > arr[i-1] {
                pIndex = i - 1 
                break
            }
        }
        
        if pIndex == -1 {
            return -1
        }
        
        var eIndexToSwap = 0
        // find the first present number that is greater
        for i in stride(from: arr.count-1, to: pIndex, by: -1) {
            if arr[pIndex] < arr[i] {
                eIndexToSwap = i
                break
            }
        }
        
        // 123[4]55321
        // 123 5 54321
        // 123 4 12345
        
        //1222[2]333
        //1222 3 233 
        arr.swapAt(pIndex, eIndexToSwap)
        let reversed = arr[(pIndex+1)...].reversed()
        let result = arr[0...pIndex] + reversed
        
        let ans = Int(String(result))!
        
        return ans <= Int32.max ? ans : -1
    }
}