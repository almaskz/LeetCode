class Solution {
    func maximalSquare(_ matrix: [[Character]]) -> Int {
        var arr = Array(repeating: Array(repeating: 0, count: matrix[0].count), count: matrix.count)
        
        for i in 0..<matrix.count {
            for j in 0..<matrix[0].count {
                if matrix[i][j] == "1" {
                    arr[i][j] = 1
                }
            }
        }
        
        return findAreaOfLargestSquare(&arr, arr.count, arr[0].count)
    }
    
    func findAreaOfLargestSquare(_ matrix: inout [[Int]], _ n: Int, _ m: Int) -> Int {
        var maxSoFar = 0
	    for i in 0..<n {
		    for j in 0..<m {
			    if matrix[i][j] == 1 {
			        let val = min(check(matrix, i-1, j), 
                                  check(matrix, i, j-1), 
                                  check(matrix, i-1, j-1)) + 1
                    matrix[i][j] = val
                    maxSoFar = max(val, maxSoFar)
			    }
		    }
        }
        return maxSoFar*maxSoFar
    }

    func check(_ matrix: [[Int]], _ i: Int, _ j: Int) -> Int {
	    guard i >= 0 && i < matrix.count && 
              j >= 0 && j < matrix[0].count else { return 0 }
        return matrix[i][j] 
    }
}