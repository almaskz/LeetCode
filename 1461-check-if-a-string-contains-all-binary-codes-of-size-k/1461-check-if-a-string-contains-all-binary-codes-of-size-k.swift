class Solution {
    func hasAllCodes(_ s: String, _ k: Int) -> Bool {
        guard s.count >= k else { return false } 
        // 01234567
        // 00110110
        var hashSet = Set<String>()
        var arr = Array(s)
        
        for i in 0..<arr.count-k+1 {
            let newString = String(arr[i..<i+k])
            hashSet.insert(newString)
        }
        return hashSet.count == Int(pow(Double(2), Double(k)))
    }
}