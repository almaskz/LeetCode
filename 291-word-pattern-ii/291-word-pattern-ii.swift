class Solution {
    func wordPatternMatch(_ pattern: String, _ s: String) -> Bool {
        var words = Set<[Character]>()
        var dict = [Character: [Character]]()
        return backtrack(Array(pattern), 0, Array(s), 0, &dict, &words)
    }
    
    func backtrack(_ pattern: [Character], _ pIndex: Int, 
                   _ s: [Character], _ sIndex: Int,
                   _ dict: inout [Character: [Character]],
                   _ words: inout Set<[Character]>) -> Bool {
        
        if pIndex == pattern.count && sIndex == s.count {
            return true
        } else if pIndex == pattern.count || sIndex == s.count {
            return false 
        }
        
        
        // we have already assigned pattern for this character
        if let word = dict[pattern[pIndex]] {
            if  sIndex + word.count - 1 < s.count {
                let sub = Array(s[sIndex..<(sIndex+word.count)])
                if word == sub {
                    return backtrack(pattern, pIndex + 1, 
                                 s, sIndex+word.count, 
                                 &dict, &words)       
                }
            }
            return false
        } else {
            for i in sIndex..<s.count {
                let sub = Array(s[sIndex...i])
                if words.contains(sub) { continue }
                dict[pattern[pIndex]] = sub
                words.insert(sub)
                if (backtrack(pattern, pIndex + 1, s, i + 1, &dict, &words)) {
                    return true
                }
                dict.removeValue(forKey: pattern[pIndex])
                words.remove(sub)
            }
            return false
        }
    }
}