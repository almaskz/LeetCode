class Solution {
    func getRow(_ rowIndex: Int) -> [Int] {
        if rowIndex == 0 {
            return [1]
        } else if rowIndex == 1 {
            return [1, 1]
        } else {
            let result = getRow(rowIndex-1)
            let size = result.count+1
            var ans = Array(repeating: 1, count: size)
            for i in 1..<result.count {
                ans[i] = result[i-1] + result[i]
            }
            return ans
        }
    }
}