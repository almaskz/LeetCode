class Solution {
    func nextPalindrome(_ num: String) -> String {
        let mid = num.count/2	
        let arr = Array(num)
        var half = Array(arr[0..<mid])
        var visited = [Int](repeating: -1, count: 10)
        var pIndex = -1
        for i in stride(from: half.count-1, to: 0, by: -1) {
            visited[half[i].wholeNumberValue!] = i
            if half[i] > half[i-1] {
                pIndex = i - 1
                break
            }
        }
        if pIndex == -1 {
            return ""
        }
        var eIndexToSwap: Int = 0
        // find the first (from the right to left) present number that is greater
        for i in stride(from: half.count-1, to: pIndex, by: -1) {
            if half[pIndex] < half[i] {
                eIndexToSwap = i
                break
            }
        }
        
        half.swapAt(eIndexToSwap, pIndex)
        let reversedHalf = (half[(pIndex+1)...]).reversed()
        var final = half[0...pIndex] + reversedHalf
        let reversed = final.reversed()
        if num.count % 2 != 0 {
            final.append(arr[mid])
        }
        return String(final+reversed)
    }
}