class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        //"abcabcbb"
        //    i
        //      r
        // set = [abc]
        // maxL = 3
        var arr = Array(s)
        var r = 0
        var maxL = 0
        var set = Set<Character>()
        for i in 0..<arr.count {
            while r < arr.count && set.contains(arr[r]) == false {
                set.insert(arr[r])
                maxL = max(maxL, set.count)
                r += 1
            }
            set.remove(arr[i])     
        }
        return maxL
    }
}