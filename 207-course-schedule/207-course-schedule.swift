class Solution {
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        // 0 -> 1 - 2
        // | \ /
        // 4<-3
        guard numCourses > 0 && prerequisites.count > 0 else { return true }
        var graph = makeGraph(prerequisites)
        var visited = Array(repeating: 0, count: numCourses)
        
        for i in 0..<numCourses {
            if visited[i] == 0 && hasCycle(i, graph, &visited) {
                return false
            }
        }
        return true
    }
    
    func makeGraph(_ prereqs: [[Int]]) -> [Int: [Int]] {
        var graph = [Int: [Int]]()
        for pre in prereqs {
            graph[pre[1], default: []].append(pre[0])
        }
        return graph
    }
    
    func hasCycle(_ edge: Int, _ graph: [Int: [Int]], _ visited: inout [Int]) -> Bool {
        visited[edge] = 1
        
        guard let allEdges = graph[edge] else { 
            visited[edge] = 2
            return false 
        }
        
        for nei in allEdges {
            if visited[nei] == 1 {
                return true
            } else if visited[nei] == 0 && hasCycle(nei, graph, &visited) {
                return true
            }
        }
        
        visited[edge] = 2
        return false
    }
}