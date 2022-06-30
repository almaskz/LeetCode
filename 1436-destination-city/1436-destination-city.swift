class Solution {
    func destCity(_ paths: [[String]]) -> String {
        var allFrom = Set(paths.map { $0[0] })
        var allTo = Set(paths.map { $0[1] })
    
        return allTo.subtracting(allFrom).first!
    }
}