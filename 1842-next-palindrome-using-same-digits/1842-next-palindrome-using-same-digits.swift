class Solution {
    func nextPalindrome(_ num: String) -> String {
        let mid = num.count/2	//  12121
        let arr = Array(num)
        var half = Array(arr[0..<mid])
        //print("half: \(half)")

        var pIndex = -1
        for i in stride(from: half.count-1, to: 0, by: -1) {
            //print("half[i] = \(half[i])")
            if half[i] > half[i-1] {
                pIndex = i - 1
                break
            }
        }
        if pIndex == -1 {
            //print("no pIndex")
            return ""
        }
        var eIndexToSwap: Int = 0
        for i in stride(from: half.count-1, to: pIndex, by: -1) {
                if half[pIndex] < half[i] {
                    eIndexToSwap = i
                    break
            }
        }
        half.swapAt(eIndexToSwap, pIndex)
        let sorted = (half[(pIndex+1)...]).sorted()
        var final = half[0...pIndex] + sorted
        let reversed = final.reversed()
        // consider odd
        if num.count % 2 != 0 {
            final.append(arr[mid])
        }
        return String(final+reversed)
    }
}