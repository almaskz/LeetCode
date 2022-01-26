class Solution {
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        // dfs
        
        var adj = makeGraph(prerequisites)
        
        var visited = Array(repeating: 0, count: numCourses)
        for i in 0..<numCourses {
            if visited[i] == 0 {
                if dfs(i, &visited, adj) == false {
                    return false
                }
            }
        }
        return true
        
        /*
        Mark nodes in DFS as in-process (color[v]=1) and as we loops through it's adjacent nodes, if we encounter color[v] == 1 means we found a cycle forming edge, other adjacent nodes where color[v] == 0 DSF(v). Mark nodes as visited (color[v] = 2) only after visiting all it's adjacent nodes. 
        */
    }
    
    func makeGraph(_ prerequisites: [[Int]]) -> [Int: [Int]] {
        var adj = [Int: [Int]]()
        for pre in prerequisites {
            adj[pre[0], default: [Int]()].append(pre[1])
        }
        print(adj)
        return adj
    }
   
    func dfs(_ course: Int, _ visited: inout [Int], _ adj: [Int: [Int]]) -> Bool {
        visited[course] = 1
        
        guard let edges = adj[course] else { 
            visited[course] = 2
            return true
        }
        for pre in edges {
            // cycle 
            if visited[pre] == 1 {
                return false
            } else if visited[pre] == 0 {
                if dfs(pre, &visited, adj) == false {
                    return false
                }
            }
        }
        visited[course] = 2
        return true
    }    
}