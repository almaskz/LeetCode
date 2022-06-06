class Solution {
    func canConstruct(_ s: String, _ k: Int) -> Bool {
    	var freqs = [Character: Int]() // char and its count
	    for char in s {
		    freqs[char, default: 0] += 1
	    }
	
        var countOdds = 0
        for elem in freqs {
            if elem.value % 2 != 0 {
                countOdds += 1
            }
        }

        if countOdds > k {
            return false
        } else {
            if s.count >= k {
                return true
            } else {
                return false
            }
        }
    }
}
