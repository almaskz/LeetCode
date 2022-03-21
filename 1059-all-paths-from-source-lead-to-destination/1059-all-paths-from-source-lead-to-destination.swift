class Solution {
    func leadsToDestination(_ n: Int, _ edges: [[Int]], _ source: Int, _ destination: Int) -> Bool {
        // exit conditions are: we are at node with no outgoing edges and its not destination
        // there is a cycle in the graph
        
        let graph = makeGraph(edges)
        var colors = Array(repeating: 0, count: n)    
        
        return dfs(source, &colors, graph, destination)
    }
    
    private func makeGraph(_ edges: [[Int]]) -> [Int: Set<Int>] {
        var graph = [Int: Set<Int>]()
        for edge in edges {
            graph[edge[0], default: Set<Int>()].insert(edge[1])
        }
        return graph
    }
    /*
    //        0. 1. 2  3
    colors = [1, 0, 1, 0]
    */
    func dfs(_ node: Int, _ colors: inout [Int], _ graph: [Int: Set<Int>], _ destination: Int) -> Bool {
        if colors[node] == 1 {
            return false
        }
            
        guard let adj = graph[node] else {
             return node == destination
        }
            
        colors[node] = 1
        
        for nei in adj {            // (2 , 1) 
            if colors[nei] != 2 {   // 
                if dfs(nei, &colors, graph, destination) == false {
                    return false
                }
            }
        }
        
        colors[node] = 2
        return true
    }
}