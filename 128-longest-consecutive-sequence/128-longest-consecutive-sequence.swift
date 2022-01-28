class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {
        //[100,4,200,1,3,2]
        //           i
        // nextNum = 5
        // count = 4
        // longSeq = 4
        // [ .. 1234 ... 100 ... 200]
        let set = Set(nums)
        var longSeq = 0
        
        for i in nums {
            // check if its a start of the new sequence (i-1 should not exist in our set)
            // if i-1 does not exist in our set its a start of the new sequence 
            //  and we whant to count how long is this sequence
            if set.contains(i-1) == false {
                // start of the sequence
                var nextNum = i+1
                while set.contains(nextNum) {
                    nextNum += 1
                }
                longSeq = max(longSeq, nextNum-i)
            }
        }
        
        return longSeq
        
    }
}