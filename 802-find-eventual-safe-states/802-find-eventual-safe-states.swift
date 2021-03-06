class Solution {
    func eventualSafeNodes(_ graph: [[Int]]) -> [Int] {
        var safe = [Int: Bool]()
        var result = [Int]()
        for i in 0..<graph.count {
            if dfs(i, &safe, graph) {
                result.append(i)
            }
        }
        return result
    }
    
    func dfs(_ index: Int, _ safe: inout [Int: Bool], _ graph: [[Int]]) -> Bool {
        if let value = safe[index] {
            return value
        }
        safe[index] = false
        for nei in graph[index] {
            if dfs(nei, &safe, graph) == false {
                return false
            }
        }
        safe[index] = true
        return true
    }
}