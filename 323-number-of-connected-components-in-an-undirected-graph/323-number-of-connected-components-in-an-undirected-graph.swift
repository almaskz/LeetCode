class Solution {
    func countComponents(_ n: Int, _ edges: [[Int]]) -> Int {
        var visited = Set<Int>()
        var graph = makeGraph(edges)
        
        var count = 0
        // 0..<2
        // i = 0 
        for i in 0..<n {
            if visited.contains(i) == false {
                count += 1
                dfs(i, graph, &visited)
            }
        }
        //n = 2, edges = [[1,0]]
        // graph:
        // 1 - [0]
        // visited:
        // ()
        // count = 1
        return count
    }
    
    func makeGraph(_ edges: [[Int]]) -> [Int: [Int]] {
        var graph = [Int: [Int]]()
        for edge in edges {
            graph[edge[0], default: [Int]()].append(edge[1])
            graph[edge[1], default: []].append(edge[0])
        }
        return graph
    }
    
    // 0 
    func dfs(_ cur: Int, _ graph: [Int: [Int]], _ visited: inout Set<Int>) {
        visited.insert(cur)
        
        guard let edges = graph[cur] else { return }
        for edge in edges {
            if visited.contains(edge) == false {
                dfs(edge, graph, &visited)
            }
        }
    }
}