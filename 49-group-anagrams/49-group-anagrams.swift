class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var groups = [String: [String]]()
        
        for word in strs {
            let sorted = String(word.sorted())
            groups[sorted, default: []].append(word)
        }
        
        return Array(groups.values)   
    }
}