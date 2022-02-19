class Solution {
    var ans = [String]()
    func letterCombinations(_ digits: String) -> [String] {
        guard digits.isEmpty == false else { return [] }
        var comb = String()
        let temp = Array(digits)
        backtrack(temp, &comb, 0)
        return ans
    }
    // 2 3
    // i
    // comb = ""
    //  0 1
    // [2 3], "", 0
    // ans = ["ad"],  
    func backtrack(_ nums: [Character], _ comb: inout String, _ digit: Int) {
        if comb.count == nums.count {
            ans.append(comb)
            return 
        }
        for i in digit..<nums.count {           // 1
            var candidates = helper(nums[i])    // 2->abc | 3->def
            for ch in candidates {              // a | d | e
                comb.append(ch)                 // comb = ae
                backtrack(nums, &comb, i+1) // [23], "a", 1 | [23], "ad", 2 
                comb.removeLast()               // comb = "a"
            }
        }
    }
    
    private func helper(_ digit: Character) -> String {
        if digit == "2" {
            return "abc"
        } else if digit == "3" {
            return "def"
        } else if digit == "4" {
            return "ghi"
        } else if digit == "5" {
            return "jkl"
        } else if digit == "6" {
            return "mno"
        } else if digit == "7" {
            return "pqrs"
        } else if digit == "8" {
            return "tuv"
        } else {
            return "wxyz"
        }
    }
}