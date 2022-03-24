class Solution {
    func numRescueBoats(_ people: [Int], _ limit: Int) -> Int {
        // [7,3,1], lim = 7 | count = 2
        //      l
        //    r         
        // [5,4,3,3]  lim = 5
        //        l
        //        r
        // 
        let sorted = people.sorted{ $0 > $1 }
        var l = 0, r = people.count-1
        var count = 0
        while l <= r {
            if sorted[l] + sorted[r] <= limit {
                l += 1
                r -= 1 
            } else {
                l += 1
            }
            count += 1
        }
        
        return count 
    }
}