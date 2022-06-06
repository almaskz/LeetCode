class Solution {
    func numBusesToDestination(_ routes: [[Int]], _ source: Int, _ target: Int) -> Int {
    // make graph
	//routes = [[1,2,7],[3,6,7]], source = 1, target = 6
	var graph = [Int: Set<Int>]() // busstop: index of routes 
	
	for i in 0..<routes.count {
		for j in routes[i] {
			graph[j, default: []].insert(i)
		}
	}
	// graph[1: <0>, 2: <0>, 7: <0, 1>, 3: <1>, 6: <1>]

	var queue = [(stop: source, bus: 0)] // [1, 0]
    var seen = Set<Int>() 	// <1>
    seen.insert(source)	// <1, 2, 7>

    var seenRoutes = Array(repeating: false, count: routes.count)
    // [true, true]
    // [(6, 2)]
    while !queue.isEmpty {
        var cur = queue.removeFirst() // cur = (6, 2)
        if cur.stop == target {		// 
            return cur.bus
        }
        for index in graph[cur.stop]! { // graph[3] = <1>
            if seenRoutes[index] {  
                continue
            }
            for j in routes[index] { //routes = [3,6,7]
                if !seen.contains(j) { // j = 6   
                    queue.append((stop: j, bus: cur.bus + 1)) 
                    seen.insert(j) // [1, 2, 7, 3]
                }
            }
            seenRoutes[index] = true	
    }

}

return -1
	
    }
}
