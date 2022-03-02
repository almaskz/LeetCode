class Solution {
    func originalDigits(_ s: String) -> String {
        // hashmap of freqs of letters
        var count = [Character: Int]()
        for ch in s {
            count[ch, default: 0] += 1
        }
        
        var out = Array(repeating: 0, count: 10)
        
        // z is only present in zero, and so on
        out[0] = count["z"] ?? 0    // zero
        out[2] = count["w"] ?? 0    // two
        out[4] = count["u"] ?? 0    // four
        out[6] = count["x"] ?? 0    // six
        out[8] = count["g"] ?? 0    // eight
        out[3] = (count["h"] ?? 0) - out[8]     // three, height
        out[5] = (count["f"] ?? 0) - out[4]     // five, four
        out[7] = (count["s"] ?? 0) - out[6]     // seven six
        out[9] = (count["i"] ?? 0) - out[5] - out[6] - out[8]   // nine, five, six, eight
        out[1] = (count["n"] ?? 0) - out[7] - 2*out[9]          // one, nine, seven
        
        // construct the answer
        var ans = ""
        for i in 0..<10 {
            for j in 0..<out[i] {
                ans += "\(i)"
            }
        }
        return ans
    }
}