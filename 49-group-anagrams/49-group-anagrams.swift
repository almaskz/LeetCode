class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var map = [String: [String]]() // hash and its groups
        
        for word in strs {
            let sortedHash = String(word.sorted())
            map[sortedHash, default: [String]()].append(word)
        }
        
        var groups = [[String]]()
        for elem in map {
            groups.append(elem.value)
        }
        
        return groups
    }
}