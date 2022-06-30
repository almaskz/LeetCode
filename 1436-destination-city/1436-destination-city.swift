class Solution {
    func destCity(_ paths: [[String]]) -> String {
        var set = Set<String>()
        
        for path in paths {
            let from = path[0]
            let to = path[1]
            set.insert(to)
            
        }
        for path in paths {
            let from = path[0]
            let to = path[1]
            if set.contains(from) {
                set.remove(from)
            }
        }
        
        return set.first!
    }
}