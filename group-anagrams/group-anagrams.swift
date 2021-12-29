class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var map = [[Int]: [String]]()
	    for word in strs {
		    let hash = getHash(word)
            print("hash: \(hash)")
		    map[hash, default: []].append(word)
	    }
	    var ans = [[String]]()
	    for item in map {
		    ans.append(item.value)
	    }
        return ans 
    }

    func getHash(_ word: String) -> [Int] {
	    var hash = Array(repeating: 0, count: 26)
	    let aVal = Character("a").asciiValue! // adsd
	    for i in word { // asdas
            // b - a = 1 // asd
            // a - a = 0
		    let ch = Int(i.asciiValue! - aVal)
		    hash[ch] += 1
	    }
        return hash
	    // var ans = ""
	    // for i in hash {
	    // ans += String(i)
	    // }
	    // return ans
    }
}