class Solution {
    func validTree(_ n: Int, _ edges: [[Int]]) -> Bool {
        var graph = makeGraph(edges)
        var visited = Set<Int>()
        
        return hasCycles(0, -1, graph, &visited) == false && visited.count == n
    }
    
    func makeGraph(_ edges: [[Int]]) -> [Int: [Int]] {
        var graph = [Int: [Int]]()
        for edge in edges {
            graph[edge[0], default: [Int]()].append(edge[1])
            graph[edge[1], default: [Int]()].append(edge[0])
        }
        return graph
    }
    
    func hasCycles(_ edge: Int, _ prev: Int, _ edges: [Int: [Int]], _ visited: inout Set<Int>) -> Bool {
        if visited.contains(edge) {
            return true
        } 
        visited.insert(edge)
        guard let allEdges = edges[edge] else { return false }
        for i in allEdges {
            if i == prev {
                continue
            } else if hasCycles(i, edge, edges, &visited) {
                return true
            }
        }
        return false
    }
}