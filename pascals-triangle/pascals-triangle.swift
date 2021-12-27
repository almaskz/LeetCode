class Solution {
    func generate(_ numRows: Int) -> [[Int]] {
        guard numRows > 0 else { return [[Int]]() }
        if numRows == 1 { return [[1]] }
        
        var ans = [[Int]]()
        ans.reserveCapacity(numRows)
        
        ans.append([1])
        
        for i in 1..<numRows {
            var newRow = [1]
            let preRow = ans[i-1]
            for j in 1..<preRow.count {
                let sum = preRow[j-1] + preRow[j]
                newRow.append(sum)
            }
            newRow.append(1)
            ans.append(newRow)
        }
        
        return ans
    }
}