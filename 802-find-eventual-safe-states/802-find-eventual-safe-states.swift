class Solution {
    func eventualSafeNodes(_ graph: [[Int]]) -> [Int] {
        var safe = [Int: Bool]()
        var result = [Int]()
        
        func dfs(_ index: Int) -> Bool {
            if let value = safe[index] {
                return value
            }
            safe[index] = false
            for nei in graph[index] {
                if dfs(nei) == false {
                    return false
                }
            }
            safe[index] = true
            return true
        }
        
        for i in 0..<graph.count {
            if dfs(i) {
                result.append(i)
            }
        }
        
        return result
    }
}